#!/usr/bin/env dub
/+ dub.json:
{
    "name": "rjsonl",
    "dependencies": {
        "asdf": "~>0.0.11",
        "lincount": "~>0.0.2"
    },
    "dflags-ldc": ["-mcpu=native"]
}
+/

/+
1. Timestamps may be both strings and uints - real world behavior.
2. Ids and timestamps are often in the beginning, but not always - to force candidates to build program, which is able to parse all data if needed.
3. Keys for inner objects may have the same names as id or timestamp - to prevent simple string scan, hehe.
4. Keys may have duplicates, but `uid` and `ts` are unique in the root object.
5. Program has several parameters.
6. Help: dub --single rjsonl.d -- --help
+/

import std.algorithm;
import std.base64;
import std.conv;
import std.format;
import std.functional;
import std.getopt;
import std.random;
import std.range;
import std.stdio;
import std.string;

import asdf;
import lincount;

enum sep = "";
immutable uid = "uid";
immutable ts = "ts";

size_t count = 10;
size_t secs = 60 * 60 * 24;
string file;
size_t limit = 2048;
uint delay = 0;
uint prob = 0;
size_t rate = 1;
size_t number;
uint seed;
bool useWindowsLineEnds;

Random rng;
string[] ids;
enum initTime = 1468244384;
uint lastTs = initTime;

void main(string[] args)
{
    auto helpInformation = args.getopt(
        "c|count", "Max line count",  &count,
        "t|time", "Max time in seconds", &secs,
        "o|output", "Output file name", &file,
        "l|limit", "Approximate size limit in KBs.", &limit,
        "d|delay", "Max number of seconds for the delay (default value is 0)", &delay,
        "p|prob", "Delay probability for the frame (%, default value is 0)", &prob,
        "r|rate", "Approximate number of frames per second", &rate,
        "n|number", "Number of users (default value (0) is for random generation for each frame)", &number,
        "s|seed", "Seed valued for the global RNG (default is unpredictable seed)", &seed,
        "w|wle", `Use MS Windows line ends (\r\n)`, &useWindowsLineEnds,
        );
    if (helpInformation.helpWanted)
    {
        defaultGetoptPrinter("Some information about the program.", helpInformation.options);
        return;
    }

    if(!seed)
    {
        seed = unpredictableSeed;
    }

    rng = Random(seed);
    if(number)
    {
        ids = new string[number];
        foreach(ref id; ids)
            id = Generator.genIdImpl;
    }

    File fout = stdout;
    if(file)
        fout = File(file, "w");

    auto gen = new Generator;

    size_t i;
    foreach(_; 0 .. count)
    {
        if(lastTs >= initTime + secs)
            break;
        i++;
        fout.write(gen.generate);
        fout.write(useWindowsLineEnds ? "\r\n" : "\n");
    }
    writefln("time (seconds) = %s", lastTs - initTime);
    writefln("appr. uid count = %s", gen.counter.count);
    writefln("line count = %s", i);
}

final class Generator
{
    size_t level; // inheritance level

    LPCounter counter;
    JsonSerializer!sep ser;
    Appender!(const(char)[]) app;

    this()
    {
        counter = LPCounter(128);
    }

    const(char)[] generate()
    {
        level = 0;
        app = appender!(const(char)[]);
        ser = JsonSerializer!sep(&app.put!(const(char)[]));
        genObject();
        ser.flush;
        return app.data;
    }

    void genValue()
    {
        switch(uniform!ubyte(rng))
        {
            case 0: .. case 20:
                ser.putValue(genNumber);
                break;
            case 21: .. case 30:
                ser.putValue(genBoolean);
                break;
            case 31: .. case 200:
                ser.putValue(genText);
                break;
            case 201: .. case 225:
                genArray;
                break;
            default:
                genObject;
        }
    }
    void genObject()
    {
        level++;
        auto state = ser.objectBegin;
        if(level == 1)
        {
            foreach(_; 0 .. uniform!ubyte(rng) & 3)
            {
                ser.putKey(genKey);
                genValue;
            }
            auto m = uniform!ubyte(rng);
            if(m & 1)
            {
                ser.putKey(uid);
                auto id = genId;
                counter.put(id);
                ser.putValue(id);
            }
            ser.putKey(ts);
            ser.putValue(genTs);
            if((m & 1) == 0)
            {
                ser.putKey(uid);
                auto id = genId;
                counter.put(id);
                ser.putValue(id);
            }
        }
        while(app.data.length < limit / level)
        {
            ser.putKey(genKey);
            genValue;
            ser.flush;
        }
        ser.objectEnd(state);
        level--;
    }
    void genArray()
    {
        level++;
        auto state = ser.arrayBegin;
        while(app.data.length < limit / level)
        {
            ser.elemBegin;
            genValue;
            ser.flush;
        }
        ser.arrayEnd(state);
        level--;
    }

    string genKey()
    {
        return level == 1 || uniform!ubyte(rng) % 6 ? keys[uniform!"[)"(0u, $, rng)] : genBoolean ? uid : ts;
    }

static:
    double genNumber()
    {
        return uniform!ubyte(rng) % 2 ? uniform!ubyte(rng) : uniform01!double(rng);
    }

    bool genBoolean()
    {
        return uniform!ubyte(rng) % 2;
    }

    string genText()
    {
        return (uniform!ubyte(rng) % 10 ? ascii_data : utf8_data)[uniform!"[)"(0u, $, rng)];
    }

    uint genTs()
    {
        auto ts = nextTs;
        if(delay && uniform!"[)"(0, 100, rng) < prob)
            ts -= uniform!"[)"(0, delay, rng) + 1;
        return ts;
    }

    uint nextTs()
    {
        if(!uniform!"[)"(0u, rate, rng))
            lastTs++;
        return lastTs;
    }

    string genId()
    {
        return number ? ids[uniform(0u, ids.length, rng)] : genIdImpl();
    }

    // 19 x 4 bytes, hexadecimal encoding
    string genIdImpl()
    {
        return format("%03x%016x", uniform!"[)"(0, 1 << 12, rng), uniform!ulong(rng));
    }


    shared static this()
    {
        keys = lorem.split;
        enum words_count = 8;
        string[] seps = [" ", "\"", "\\", "/", "\b", "\f", "\n", "\r", "\t"];
        ascii_data = cast(immutable) dlang.split.chunks(words_count).enumerate.map!(a => join(a[1], seps[a[0] % seps.length])).array;
        utf8_data = devil.lineSplitter.filter!(not!empty).array;
    }

    immutable char[][] keys;
    immutable char[][] ascii_data;
    immutable char[][] utf8_data;

    immutable char[] lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim est laborum.";
    immutable char[] dlang = "D allows writing large code fragments without redundantly specifying types, like dynamic languages do. On the other hand, static inference deduces types and other code properties, giving the best of both the static and the dynamic worlds. Show example  Automatic memory management makes for safe, simple, and robust code. D also supports scoped resource management (aka the RAII idiom) and scope statements for deterministic transactional code that is easy to write and read. Show example Built-in linear and associative arrays, slices, and ranges make daily programming simple and pleasant for tasks, both small and large. Show example ";
    immutable char[] devil = q{
В те дни, когда мне были новы
Все впечатленья бытия -
И взоры дев, и шум дубровы,
И ночью пенье соловья,-
Когда возвышенные чувства,
Свобода, слава и любовь
И вдохновенные искусства
Так сильно волновали кровь,-
Часы надежд и наслаждений
Тоской внезапной осеня,
Тогда какой-то злобный гений
Стал тайно навещать меня.
Печальны были наши встречи:
Его улыбка, чудный взгляд,
Его язвительные речи
Вливали в душу хладный яд.
Неистощимой клеветою
Он провиденье искушал;
Он звал прекрасное мечтою;
Он вдохновенье презирал;
Не верил он любви, свободе;
На жизнь насмешливо глядел -
И ничего во всей природе
Благословить он не хотел.
};
}

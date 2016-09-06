
# Data Engineer Challenge

The goal of the challenge is to have a tool that is able
to stream data from [kafka](http://kafka.apache.org/) and count unique things within this data.
The simplest use case is that we want to calculate unique users per minute, day, week, month, year. 

- The data consists of (Log)-Frames of JSON data that are streamed into/from apache kafka. 
- Each frame has a timestamp property which is unixtime 
- You can assume that 99.9% of the frames arrive with a maximum latency of 5 seconds. 
- you want to display the results as soon as possible
- the results should be forwarded to a new kafka topic (again as json.) choose a suitable structure. 
- for an advanced solution you should assume that you can *not* guarantee that events are always strictly ordered.

## Requirements:
- your solution needs to build on linux with one command (and ideally the result is a single executable binary.) 
- if dependencies / libs are needed provide a readme / install script
- write a report / have stats on performance (frames per second) and ideally also memory usage.
- if possible measure also the performance impact / overhead of the json parser
- document your approach on how you decide **when** to output the data 
- document the estimated error in counting
- implement your solution in either D, rust, go, C++ or C. (other languages are accepted too, but you should be able to process above 50'000 frames per second per cpu core).
- it should be possible to ingest historical data. e.g. from the last 2 years.

## sample data

For a quick start you can use the sample data provided at [http://tx.tamedia.ch.s3.amazonaws.com/challenge/data/stream.jsonl.gz](http://tx.tamedia.ch.s3.amazonaws.com/challenge/data/stream.jsonl.gz):

it was generated using `./data-generator -c 1000000 -o stream.jsonl -r 1000 -n 100000`

`cat stream.jsonl | jq .uid -r | gsort --parallel=4 | guniq | wc -l` yields `99993` unique ids.

you can just input this file to you kafka topic once by something like 

`gzcat stream.gz | kafka-console-producer --broker-list localhost:9092 --topic mytopic`  

You can also generate your own data by using the data-generator tool. it allows you to introduce random-ness if you have a more advanced solution and want to test it. it requires you to install a Dlang compiler and D's package manager. then execute `dub build` to build the binary. binaries for os x and linux are in the bin directory.

## suggested steps:

1. install kafka
2. create and configure (control disk space!) a topic
3. use the kafka producer from kafka itself to send our test data to your topic
4. create a small app that reads this data from kafka and prints it to stdout
5. find a suitable data structure for counting and implement a simple counting mechanism
6. benchmark / measure / tune
7. only now think about the edge cases, options and other things

## Evaluation Criteria & Expectations

- clean project setup and documentation
- ability to write performant code to handle streaming data. measure and document _how_ fast your solution is.
- Understanding how to benchmark and analyze performance bottle necks. what tools did you use?
- awareness of the mechanisms and costs of serialization. Explain (and ideally prove!) why json is an ideal format here or why not and then suggest a better solution.
- research and implement optimal data structure for a specific use case. explain which and why.
- scalability: _explain_ how you _would_ scale your approach


## Bonus Questions / Challenges:

- how do you scale it to improve troughput.
- you may want count things for different time frames but only do json parsing once.  
- explain how you would cope with failure if the app crashes mid day / mid year. 
- when creating e.g. per minute statistics, how do you handle frames that arrive late or frames with a random timestamp (e.g. hit by a bitflip)?
- make it accept data also from std-in (instead of kafka) for rapid prototyping. (this might be helpful to have for testing anyways)


## Hints:

- tap into other peoples know-how and code. 
- expected time is ~8 hours. If you are above that think about which parts to leave out and just document HOW you would do them. It took me about 2 hours and ~20 lines of self written code for the most basic version in Golang. Most of the Time was spent on researching the libraries. 
- triple check that your last commit compiles.



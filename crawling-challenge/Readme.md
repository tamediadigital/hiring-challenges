# Tamedia TDA Crawling Challenge.

## Intro 

This challenge is about showing us that you are a hacker with a fast perception and excellent analytic skills but also that you are able to build robust and scalable solutions.
We want you to build a *distibuted crawler* that retrieves a list of products that any of our major sites offer. 

### Sites
- www.ricardo.ch - Platform similar to ebay [Play Store](https://play.google.com/store/apps/details?id=com.qxl.Client)
- www.tutti.ch - Platform similar to craigslist [Play Store](https://play.google.com/store/apps/details?id=ch.tutti)
- www.20min.ch - News [Play Store](https://play.google.com/store/apps/details?id=ch.iAgentur.i20Min)
- www.tagesanzeiger.ch - News [Play Store](https://play.google.com/store/apps/details?id=com.phonegap.tagesanzeiger)
- www.homegate.ch - Real estate [Play Store](https://play.google.com/store/apps/details?id=ch.homegate.mobile)
- www.jobs.ch - Jobs [Play Store](https://play.google.com/store/apps/details?id=com.iAgentur.jobsCh)

## Step 1
You should choose one of the above platforms and then reverse engineer their mobile API.
E.g. by using Mitmproxy or Charles Proxy. 
Extract the endpoints to get the list/search and the detail entries.

## Step 2
Use their API to build a distributed crawler in your language/framework of choice with the following features:

- one JSON record per article with full details
- results in one, or many files, one JSON record per line, gzip file
- to speed up the crawling, the program should scale horizontally, i.e. can be deployed in a cluster, while still dumping each article only once
- provide a [Dockerfile](https://docs.docker.com/engine/reference/builder/) to build your code
- write a [docker-compose.yml](https://docs.docker.com/compose/) for local testing

You do not necessarily need to implement all features (e.g. docker-compose) but make sure you document your decisions and TODOs.
Watch your time and try to get as far as possible in about 5-8 hours of hacking.

## Evaluation criterias

What we look for:

- ability to break down *business* requirements into prototype code
- code can be built and run with one command
- [Clean code](https://www.amazon.com/Clean-Coder-Conduct-Professional-Programmers/dp/0137081073/) and [architecture](https://www.amazon.com/Clean-Architecture-Craftsmans-Software-Structure/dp/0134494164/)
- proper use of language and framework idioms
- usage of external libraries that should simplify the task
- strip away features, time is scarce!
- document your approach, your decisions and your general notes

Bonus:
- minimize resource usage
- provide a critique of the API you reverse engineered
- add additional features/gimmicks/easter egg
- extra bonus points for making us laugh

Hints:
- check that your last commit compiles
- send us link where to checkout code from (e.g. github)


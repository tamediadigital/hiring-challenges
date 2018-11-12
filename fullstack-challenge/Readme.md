# Tamedia TDA Full-Stack Challenge.

## Intro 

This challenge is about showing us that you are a hacker with a fast perception and excellent analytic skills but also that you are able to dive into and leverage modern web technologies to create an awesome user experience.
We want you to build a progressive web application that shows a simple view on a list of products that any of our major sites offer. 

### Sites
- www.ricardo.ch - platform similar to ebay [play store](https://play.google.com/store/apps/details?id=com.qxl.Client)
- www.tutti.ch - platform similar to craigslist [play store](https://play.google.com/store/apps/details?id=ch.tutti)
- www.20min.ch - news [play store](https://play.google.com/store/apps/details?id=ch.iAgentur.i20Min)
- www.tagesanzeiger.ch - news [play store](https://play.google.com/store/apps/details?id=com.phonegap.tagesanzeiger)
- www.homegate.ch - real estate [play store](https://play.google.com/store/apps/details?id=ch.homegate.mobile)
- www.jobs.ch - jobs [play store](https://play.google.com/store/apps/details?id=com.iAgentur.jobsCh)

## step 1
You should choose one of the above platforms and then reverse engineer their mobile API.
E.g. by using Mitmproxy or Charles Proxy. 
Extract the endpoints to get the list/search and the detail entries.

## step 2
Use their API to build a small progressive web application with 2 simple views:

- a list of products (e.g. newest 20, whatever the API proivdes) 
- a detail view if you tap on a product.

You can find more information about what a Progressive web here in Fabians Paper at [progressive-web-apps.md](progressive-web-apps.md)

You do not necessairly need to implement all features (e.g. notifications). 
Watch your time and try to get as far as possible in about 5-8 hours of hacking.

## Evaluation criterias

What we look for:

- clean project setup and documentation
- ability to dive into a new topic, extract the important points and then code it up.
- **polish and an eye for design:** focus on making it look good instead of adding features.
- make it snappy 
- **display the important information at the right place without overloading**. (e.g. in a list view of real estate properties, what are the important pieces of information beside a picture?) 
- strip away features, time is scarce!
- document your approach, your decisions and your general notes

Bonus:
- add innovative features into these "classic" views.
- provide a critique of the API you reverse engineered.
- add additional features/gimmicks/easter egg.
- extra bonus points for making us laugh

### Hints: 
- Progressive Web Apps need TLS endpoints. Sadly we have sites that do not offer https. If you still want to use one of these you need to hack around that.





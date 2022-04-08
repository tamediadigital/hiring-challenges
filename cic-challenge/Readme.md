# CIC Python Crawling Challenge

## Intro 

This challenge is about showing us that you are a hacker with a fast perception and excellent analytic skills but also that you are able to build robust and scalable solutions. 
We have 2 parts in this challenge, first a Crawling Task, and secondly a Data Engineering Task where we ask you to deduplicate two datasets.

The main objective is to see your idea of implementation and your code organization. You are free to use any python libraries & tools to achieve your results, but keep in mind that readability and simplicity in terms of code and approach is important.


### Crawling task
Our main goal in this part is to test how you approach and implement a data crawler for the Real Estate Marketplace immowelt.com using their mobile API as an access point for data collection. To limit the scope of the task, and to help you get going we have prepared some helpful pieces of information for mobile API reverse engineering:

1. Implement a scraper for this website using Python
2. To request this API you will need to pass the authorization process. This is the headers that you would need to post to get an access token:

   ```
   {'accept': '*/*', 'content-type': 'application/x-www-form-urlencoded; charset=utf-8', 'authorization': 'Basic aW1tb3dlbHRfbW9iaWxlX2FwcF9pb3NfMjo5UXVHa20xM1k0WEZPZHFzZW05eGh4RVVKejR2UWdEWA==', 'accept-encoding': 'br;q=1.0, gzip;q=0.9, deflate;q=0.8', 'user-agent': 'immowelt/7.8.1 (de.immowelt.immoweltapp; build:271; iOS 14.7.1) Alamofire/5.5.0', 'accept-language': 'en-RS;q=1.0, sr-RS;q=0.9, sr-Latn-RS;q=0.8, de-RS;q=0.7'}
   ```
   
   And this is the data that you need to post to get the token:
    ```json
    {"grant_type": "client_credentials"}
    ```
    And the location where to post it to get the token:
    https://api.immowelt.com/auth/oauth/token
    
    When you get the access token, you are ready to request listings with the search API.
3. API link for listing search: 
    https://api.immowelt.com/estatesearch/EstateSearch/v1/Search
    
    your headers should look like this:
    ```json
    {"accept": "application/json", "content-type": "application/json", "accept-language": "en-RS;q=1.0, sr-RS;q=0.9, sr-Latn-RS;q=0.8, de-RS;q=0.7", "accept-encoding": "br;q=1.0, gzip;q=0.9, deflate;q=0.8", "content-length": "224", "user-agent": "immowelt/7.8.1 (de.immowelt.immoweltapp; build:271; iOS 14.7.1) Alamofire/5.5.0", "authorization": "Bearer <access_token>", "Content-Type": "application/json"}
    ```
    and the parameters & categories we would like you to use, should look like this:
    ```json
    {"construction": {}, "general": {"category": [], "distributionType": "ZUR_MIETE", "equipment": [], "estateType": ["WOHNUNG", "LAND_FORSTWIRTSCHAFT", "WOHNGEMEINSCHAFT", "GARAGE_STELLPLATZ", "GASTRONOMIE_HOTEL", "HALLEN_INDUSTRIEFLAECHE", "HAUS", "BUERO_PRAXISFLAECHE", "GRUNDSTUECK", "SONSTIGES", "LADENFLAECHE", "WOHNEN_AUF_ZEIT", "GEWERBE_GRUNDSTUECK", "RENDITEOBJEKT"]}, "location": {"geo": {"locationId": [516424, 518004, 518044, 517940]}}, "offset": "0", "pagesize": "5000", "pricing": {}, "sort": "SortByCreateDate"}
    ```
    This means you search this API by location ids, distributionType (sale/rent), estateType etc. 
    
4. Save the scraped data into a json file (one JSON record per listing with full details) which you will upload on git.
 

## Data Engineering task

You can find 2 files with data from 2 biggest real estate platforms in Switzerland.
One is homegate.jsonl.gz and the second is immoscout24.jsonl.gz. Your goal is to find which listings between these 2 platforms are the same(overlapping). 

For example, the same apartment can be listed on both homegate.ch and immoscout24.ch (also it can be duplicated within a platform - so the implementation should check for overlaps within and between platforms.) by different agencies.

One json item in the file contains all details for one property with this list of fields:
id, title, description, price, category, sale_type, images, living_space, floor, rooms, zip_code, city and url (for easier testing)

Design and implement a script that will find the duplicate listings, and return the result as a list of lists, containing only the duplicate listings.

The output should be a json file with the following format(using the ids provided in the two input files):
```json
[[{"platform":"homegate","id":"123"},{"platform":"immoscout24","id":"abc"}],[{"platform":"homegate","id":"123"},{"platform":"immoscout24","id":"abc"},{"platform":"homegate","id":"456"}]]
```


 

## Other points to keep in mind

- provide a [Dockerfile](https://docs.docker.com/engine/reference/builder/) to build your code
- write a [docker-compose.yml](https://docs.docker.com/compose/) for local testing

You do not necessarily need to implement all features (e.g. docker-compose) but make sure you document your decisions and TODOs. Watch your time and try to get as far as possible in about 5-8 hours of hacking. If you don’t have time to finish everything, please write down your thoughts and how you would finish the remaining part.


## Evaluation criterias

What we look for:

- ability to break down *business* requirements into prototype code
- code can be built and run with one command
- [Clean code](https://www.amazon.com/Clean-Coder-Conduct-Professional-Programmers/dp/0137081073/) and [architecture](https://www.amazon.com/Clean-Architecture-Craftsmans-Software-Structure/dp/0134494164/)
- proper use of language and framework idioms
- usage of external libraries that should simplify the task
- strip away features, time is scarce!
- document your approach, your decisions and your general notes
- ability to solve problems, be creative and work efficiently

Bonus:
- minimize resource & request usage - remember a good crawler is one that doesn’t get detected.
- add additional features/gimmicks/easter egg
- extra bonus points for making us laugh

Hints:
- check that your last commit compiles
- send us link where to checkout code from (e.g. github)


# Ankh-Morpork Unified User Systeme Challenge

## Intro
The Platform Services department of Ankh-Morpork is in the middle of a city-wide user data migration. Our goal is to migrate all users of the cities largest social networks, unseen.dw, pseudopolis.dw and mended-drum.dw, into a single user identity system (AMUUS: Ankh-Morpork Unified User Systeme).

Exciting!

In preparation for the grand migration, we've decided to task you with building a tool which will help us __understand what the current user overlap__ of the social networks looks like.

**Please do not invest more than 5 to 8 hours.** If you can't complete the task within that timeframe, document where you got stuck, so we can use it as a basis for discussion for your next interview.

## Your mission, should you choose to accept it:

### Step 1

Using the data dumps we have included in this repository and the tools of your choice, build an HTML report, which shows:
- The overall overlap between all three social networks in percent, count of users and a graph of your choice
- The overlap between all combinations of social networks (unseen.dw <-> pseudopolis.dw, unseen.dw <-> mended-drum.dw, pseudopolis.dw <-> mended-drum.dw). Percentage, count of users and a graph of your choice for each
- A table with the top 10 most frequent zip codes, sorted in descending order by occurrence

### Step 2

* Create a Dockerfile that allows other developers to run the application. The idea here is that all we need to review the application is a Dockerfile and your assets. Hosting the project directly from the running docker container, or producing a folder with the assets which can be used without a web server, is up to you.
This is no different to how we deploy our code in our production environment.

## Evaluation criteria

What we look for:

- Clean project setup and documentation
- Ability to determine what the actual problem space is and find a fitting solution
- Relevant tests for your code
- Strip away features if necessary, time is scarce!
- Document your approach, your decisions and your general notes


# Product Owner Challenge

The goal of the challenge is to analyze following requirement and give explanation of the text.
It has to be analyzed from PO perspective and to give short project break down.

We would like to hear:
- How you understand the project
- How would you break it down into smaller executable peaces
- What do you see as the biggest challenges


## Requirements:
- provide a written explanation
- try to break it down using tool or methodology of your choice


# REQUIREMENTS TEXT: opt-out dashboard

# Motivation

Leveraging the value of audience data collected on all TX Group platform, DTS Mission, highly depends if the users consent to collect and process their data.

What we want is to track the opt-.out rate per target(web site), per channel(desktop, mobile, ios, android) and per day.

# Problem statment

Consents are collected in 2 platforms :

- OneTrust CMP for web platforms (only deployed on Ricardo, Tutti, CarForYou, Le Matin for the time being, on 22.10.2021)
- BeagleNative CMP for native apps (no deployment yet, on 22.10.2021)

The consents given per users can be fetched :

- through an API on OneTrust - documentation is [here](https://developer.onetrust.com/api-reference/preference-consent-management/consent-management/consent-management-apis/receipts-v2/getreceiptlistdetailsusingpost) - for web platforms
- BeagleNative CMP pushes the TC String on a DTS [endpoint](https://zuba.prod.tda.link/v3/mobile/events/smpnative.json).

The consents collected are very detailed, as the user can consent his data to be processed for a certain purpose (like content personalisation) but not for another one (like ads targeting). Further more, use have the possibility to grant a vendor (liek TX Group) to process his data, but not another one (like Google). And depending where the user is, consent can be granted by legitimate interests (by default) or through an explicite opt-in. Therefore, each consents must be parsed to evaluate if we got a legal basis is collected for the specific purpose we want to track.

Due to the huge amount of data this represents, it's possible to compute the KPIs on samples.

# Scope

## Functional requirements

The dashboards are in PowerBI, available in Technology - Data Technology sections

Ideally, the charts below are available on one page, but UX can challenge this.

### KPI - Nb and % of users who consented for ads targeting

- KPI = How many users have consented to be delivered with personalized ads in the last 13 months : in absolute number and in percentage of total nb of users
- A user is, in this use case a uid (i.e. a Beagle Cookie ID or a Native app client ref)
- per day, user can choose a time period
- A total and a percentage for the full period is available
- breakable down per target and per channel
- line chart

### KPI - Nb and % of users we are able to target with personalized ads

- KPI = fpr a given day, for how many users active during this day we get the consent to be targeted with personalized ads, in absolute number and in percentage of total nb of active users on this given day ?
- A user is, in this use case a uid (i.e. a Beagle Cookie ID or a Native app client ref)
- per day, user can choose a time period
- A average per day and an average % for the full period is available
- breakable down per target and per channel
- line chart

## Non Functional requirements

- Computed every day, for data over the last 13 months until previous day
- Availabilty : 98.5 % (5 days in a year not available)

## Future work

- compute the same kind of KPIs for another purpose (like content personalization)

# Out of scope

We focus only on TCF purposes, not the cookie compliance



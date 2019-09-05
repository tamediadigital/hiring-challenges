
## Project Setup

### Project template
This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

### Docker usage

### Prerequisites

Before we make use of docker, we need to clone the project: 

```git clone https://github.com/civerazdaM/conversation-app.git```. 

Then we need to ```cd conversation-app```.

#### Docker dev
It can be run in dev mode with fallowing command :

First build dev docker image: ```docker build -t sample:dev .```.

After build is done run: ```docker run -v ${PWD}:/app -v /app/node_modules -p 3001:3000 --rm sample:dev```.

App can be accessed then in dev mode on [http://localhost:3001](http://localhost:3001).

#### Docker prod

It can be run in prod mode with fallowing command :

First build prod docker image: ```docker build -f Dockerfile-prod -t sample:prod .```.

After build is done run: ```docker run -it -p 80:80 --rm sample:prod```.

App can be accessed then in prod mode on [http://localhost:80](http://localhost:80).

## App overview

App consists of 4 main components: Conversations, Conversation, Messages, Message.

Conversations is in charge of getting conversation data, controlling it, and passing data to individual Conversation component that is in charge of presenting the data.

Messages is in charge of getting messages in specific conversation, controlling them, uploading new messages to that conversation, and passing data to individual Message component that is in charge of presenting the data.

UserProvider is used as a way to enable encapsulation of user data in one place, so that we can easily reuse user data through the app. This is achieved by using context api in react, and hooks.

All state in application is managed using hooks.

I used fetch for making api calls. I used primitive approach with this, because of timely manner, this should be improved e.g. we could create callApi function that will encapsulate fetch api specifics, and provide uniform interface for calling api within our app. In case we want to replace fetch with some new shiny library we would have just one file to edit, instead of whole project.

I am using css modules. Design is simple, and it reflects FB messenger style the most I would say. Mobile design needs to be improved. For smallest screens we should change layout a bit. User should see just conversations, and then when he clicks on one, user should see messages in that conversation. Also we need to add back button in messages so that user could go back to list of conversations in that scenario.

I also didn't have a time to implement a time information bellow grouped messages.



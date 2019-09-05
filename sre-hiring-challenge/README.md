# SRE hiring challenge
Your goal is to add the [lambda functions](https://github.com/tamediadigital/conversation-echo-api) to our our docker-compose setup (as you see it here in this repository). It includes a [front-end](/conversation-app) which relies on the lambda functions. You can use this to test your work. It lives at `localhost:5050`.

### Step 1
- Convert [this lambda application (handler.py)](https://github.com/tamediadigital/conversation-echo-api) to a [flask](https://palletsprojects.com/p/flask/) application.
The expected behaviour of the API is documented [here](https://petstore.swagger.io/?url=https://raw.githubusercontent.com/tamediadigital/hiring-challenges/master/conversation-frontend-challenge/api.yaml)
- Create a Dockerfile for the flask app. The [front-end](https://github.com/tamediadigital/hiring-challenges/tree/master/sre-hiring-challenge/conversation-app) (on `http://localhost:5050`) expects it to run on port `5000`.
- Add the newly dockerized flask application to [our docker-compose setup](docker-compose.yml)
- If everything works, after running `docker-compose up`, the front-end app on `http://localhost:5050` will connect to your API on `http://localhost:5000` and should render a list of users and if you click on them, you'll see their conversation.

### Step 2
Create a Grafana Dashboard [here](http://localhost:3000)


The dashboard should contain two graphs for our conversation-api and conversation-app containers:
- Total memory consumption `container_memory_usage_bytes`
- Network traffic `container_network_receive_bytes_total`

It should look something like this:
![Dashboard screenshot](https://github.com/tamediadigital/hiring-challenges/blob/master/sre-hiring-challenge/grafana/dashboard-screenshot.png?raw=true)

## Evaluation criteria
- The lambda functions are pretty simple, we expect the resulting flask application to be equally simple. Even if you don't know python, the flask documentation should provide enough guidance
- The Dockerfile and your changes to docker-compose.yml are sensible and concise. You can talk about the pros and cons of your setup in relation to convenience vs security.
- You document your process
- It works reliably. `docker-compose up` and your documentation should be all that is required to review your solution

# Notes
__Please do not use more than 2 - 8 hours for this challenge__. If you are going over time, just finish documenting your process so we can discuss where you ran in to difficulties.


If you clone this repository and have docker and docker-compose installed, running `docker-compose up` should give you:
- [prometheus](http://localhost:9090)
- [grafana](http://localhost:3000)
- [cadvisor](http://localhost:8080)
- [frontend app](http://localhost:5050)

If any of those don't work and you can't make it work, please contact us with the issue.

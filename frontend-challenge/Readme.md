# Frontend Developer Challenge

Consider this open API: [https://jsonplaceholder.typicode.com/](https://jsonplaceholder.typicode.com/)

This challenge is about showing us that you are a fast learner who is able to dive into and leverage modern web technologies to create an awesome user experience.
The goal of this challenge is to build a web application that uses this fake API to simulate sending and receiving posts for a given user.

## Requirements
- Provide a Readme that shows how to build and run the code on Linux or OS X
- Write a report: What did you do? What was the reasons you did it like that?
- Develop a web application with your favorite framework (Vue.js, React.js, Angular) that does the following:
  1. Show initially an input field where user can type an E-Mail address
  2. Show a button next to the input field, that continues to step 3 when pressed
  3. Validate the input and if the input is not an E-Mail address show an error message and stop
  4. Since this is a known API user, save the E-Mail address so that it's automatically filled in the input field next time the user opens the application
  5. Get a list of posts for this user (hint: use the user's id with this endpoint: https://jsonplaceholder.typicode.com/posts?userId=USER_ID )
  6. Create a new post and send it
  7. Append newly created posts (note: API won't actually save new posts so just add it locally)

## Notes:
- Free choice of guidelines/frameworks/libraries to use: this choice should reflect what you consider to be the best practice
- You do not necessairly need to implement all features. Watch your time and try to get as far as possible in about 6-8 hours of hacking.

## What we're looking for:
- Nice user experience
- Ability to break down *business* requirements into prototype code
- [Clean code](https://www.amazon.com/Clean-Coder-Conduct-Professional-Programmers/dp/0137081073/) and [architecture](https://www.amazon.com/Clean-Architecture-Craftsmans-Software-Structure/dp/0134494164/)
- Separation into UI and testable business logic
- Proper use of language and framework idioms
- Usage of external libraries that should simplify the task

## Bonus features
- Obfuscate the app and secure the communication channel
- Build and test your code on CircleCI or similar
- Add innovative features into these "classic" views
- Add additional features/gimmicks/easter egg
- Extra bonus points for making us laugh

Have fun!

# Mobile Engineer Challenge

Consider this open API: [https://jsonplaceholder.typicode.com/](https://jsonplaceholder.typicode.com/)

The goal of the challenge is to write a native mobile app (Android/iOS) that uses this fake API to simulate
sending and receiving posts for a given user.

## Requirements
- Provide a Readme that shows how to build and run the code on Linux or OS X
- Write a report: What did you do? What was the reasons you did it like that?
- Develop a *native* Android or iOS app that does the following:
  1. Show initially an input field where user can type an email address
  2. Show a "Go" button next to the input field, that continues to step 3 when pressed
  3. Validate the input and if the input is not an email address show an error message and stop
  4. Since this is a known api user, save the email address so that it's automatically filled in the input field next time the user starts the app
  5. Get a list of posts for this user (hint: use the user's id with this endpoint: https://jsonplaceholder.typicode.com/posts?userId=USER_ID )
  6. Create a new post and send it. In case of network loss, add it to permanent local queue (app should be able to keep pending posts locally, even when app is stopped and restarted)
  7. On network reconnect, automatically send all pending post
  8. Append new created posts (note: api won't actually save new post so just add it locally)

## Notes:
- No need to go fancy on design guidelines, just keep the UI effort to a minimum
- The app should complete the work after the "Go" button is pressed even if the device is rotated and the screen is recreated
- Free choice of guidelines/frameworks/libraries to use: this choice should reflect what you consider to be the best practice

## What we're looking for:
- Ability to break down *business* requirements into simple prototype code
- [Clean code](https://www.amazon.com/Clean-Coder-Conduct-Professional-Programmers/dp/0137081073/) and [architecture](https://www.amazon.com/Clean-Architecture-Craftsmans-Software-Structure/dp/0134494164/)
- Separation into UI and core with documented core API interface
- Proper use of language and platform idioms
- Ability to execute a queue of network requests even when network was lost
- Usage of external libraries that should simplify the task

## Bonus features
- Implement the app on both Android and iOS
- Build and test your code on CircleCI or similar
- Minimize app size, measure resource usage
- Obfuscate the app

Have fun!

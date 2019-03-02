# Social Feed Challenge

## Your mission, if you choose to accept it:

Our reporters have a burning desire to know whats going on in the wonderful world of social media!

The three social networks they are interested in:

[Twitter](https://7govymftog.execute-api.eu-west-1.amazonaws.com/production/twitter)
[Facebook](https://7govymftog.execute-api.eu-west-1.amazonaws.com/production/facebook)
[Instagram](https://7govymftog.execute-api.eu-west-1.amazonaws.com/production/instagram)

Because these social networks are so webscale, they don't always respond predictably. The delay in their response almost appears like someone waited for a random integer of seconds before responding!

Also, sometimes they will respond with an error. This error might not be valid JSON. Life's hard sometimes.

Our reporter friends need to be able to run your project with `docker run -p 3000:3000 social-feeds`, then issue the command:

```
curl localhost:3000
```

And get back a JSON response of the output from the three social networks in the format:

```
{ twitter: [tweets], facebook: [statuses], instagram: [photos] }
```

Order isn't important.

This should be a quick little task, but our news sites are kinda important to us, so make sure your implementation is as robust as it is readable.

## Evaluation criterias

What we look for:

- Clean project setup and documentation
- Ability to determine what the actual problem space is and find a fitting solution
- Relevant tests for your code

### Bonus

- Add [instrumentation](https://prometheus.io)
- Explain how your project would scale to hundreds of feeds, spread across the globe. What would have
  to change, what would stay the same?
- Explain how you would cope with failure if the app crashes mid day / mid year.

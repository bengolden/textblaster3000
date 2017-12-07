# Overview

Simple application for sending bulk text messages and viewing responses via Twilio.

* This is a prototype, and has no test suite. Everything works in production. Maybe.

### To use the app:

Visit http://textblaster3000.herokuapp.com/

### To set up a new instance:
1) Create a new Twilio Connect application.
2) Change the link in views/layouts/_navbar.html.erb to match your Twilio Connect app.
3) Create an environment variable called TWILIO_AUTH_TOKEN with your Twilio auth token.

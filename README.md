GIFMessenger
============

Message robot that responds to a sms with a mms GIF based on your text search

install <a src="https://ngrok.com/">ngrok</a>
get a Twilio API Key and set up the sms to a get request to your ngrok domain
```
git clone https://github.com/sachinahj/GIFMessenger.git
cd GIFMessenger
bundle install
ngrok -subdomain=YOUR_DOMAIN 4567
budle exec ruby twilio.rb
```
Text your twilio number!


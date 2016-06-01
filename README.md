# Discord Distance Calculator

# What does this do?
This is a simple package that allows your Discord bots to calculate the distance between two geographical points.
Distance can be returned in miles and kilometers.

# How do I use this?
Create a bot that will invited to your channel. 
```
credentials = BotCredentials.new
bot = Discordrb::Bot.new token: credentials.token , application_id: credentials.application_id
```
Once connected, have the bot listen for incoming messages. Declare a handler object to pickup messages and deliver the appropriate response.
```
bot.message do |event|
	handler = MessageHandler.new(event.message.to_s)
	event.respond handler.get_response
end
```
The distance calculator will now listen for ```!distance```  along with two parameters representing the two locations.


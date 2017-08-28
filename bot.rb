require 'discordrb'
require_relative 'message_handler.rb'
require_relative 'bot_credentials.rb' # use your own object for token and application_id

credentials = BotCredentials.new

bot = Discordrb::Bot.new token: credentials.token , client_id: credentials.application_id
puts "This bot's invite URL is #{bot.invite_url}."

bot.message do |event|
	handler = MessageHandler.new(event.message.to_s)
	event.respond handler.get_response
end

bot.run

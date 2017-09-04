require 'discordrb'
module DiscordDistanceCalculator
  class Bot
    def self.start
      bot = Discordrb::Bot.new token: ENV['DISCORD_TOKEN'] , client_id: ENV['DISCORD_CLIENT_ID']
      puts "This bot's invite URL is #{bot.invite_url}."

      bot.message do |event|
        handler = DiscordDistanceCalculator::MessageHandler.new(event.message.to_s)
        event.respond handler.get_response
      end

      bot.run
    end
  end
end

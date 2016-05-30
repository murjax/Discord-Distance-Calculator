require_relative 'distance_calculator.rb'

class MessageHandler
	attr_reader :message
	def initialize(message)
		@message = message
	end

	def has_command?
		if message.start_with?('!distance')
			return true
		else
			return false
		end
	end

	def get_locations
		locations = []
		parts = message.split(" ")
		locations.push(parts[1])
		locations.push(parts[2])
		locations
	end

	def distance_calculator
		calculator = DistanceCalculator.new(get_locations)
		calculator.get_miles
	end

	def get_response
		if has_command?
			"The distance between these two points is #{distance_calculator} miles."
		end
	end
end
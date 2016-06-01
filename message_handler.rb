require_relative 'distance_calculator.rb'

class MessageHandler
	attr_reader :message
	def initialize(message)
		@message = message
	end

	def has_command?
		message.start_with?('!distance')
	end

	def has_km?
		message.end_with?(' km')
	end

	def get_locations
		locations = []
		parts = message.split(" ")
		locations.push(parts[1]).push(parts[2])
	end

	def distance_calculator(unit_type = "mi")
		calculator = DistanceCalculator.new(get_locations)
		return unit_type == "mi" ? calculator.get_miles : calculator.get_kilometers
		
		
	end

	def get_response
		if has_command?
			has_km? ? "The distance between these two points is #{distance_calculator("km")} kilometers." : 
				"The distance between these two points is #{distance_calculator} miles."
		end
	end
end
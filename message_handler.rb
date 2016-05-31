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

	def has_km?
		if message.end_with?(' km')
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

	def distance_calculator(unit_type = "mi")
		calculator = DistanceCalculator.new(get_locations)
		if unit_type == "mi"
			calculator.get_miles
		else
			calculator.get_kilometers
		end
		
	end

	def get_response
		if has_command?
			if has_km?
				"The distance between these two points is #{distance_calculator("km")} kilometers."
			else
				"The distance between these two points is #{distance_calculator} miles."
			end
			
		end
	end
end
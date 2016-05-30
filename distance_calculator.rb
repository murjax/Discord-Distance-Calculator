require 'geocoder'
require_relative 'geocoder_configure.rb'

class String
	def numeric?
		Float(self) != nil rescue false
	end
end

class DistanceCalculator

	attr_reader :locations

	def initialize(locations)
		@locations = locations
	end

	def get_miles
		coordinates = get_coordinates
		distance = Geocoder::Calculations.distance_between(coordinates[0], coordinates[1])
		if distance.nan?
			return distance = 0
		else
			return distance.round(0)
		end
		
	end

	def get_kilos
		coordinates = get_coordinates
		distance = Geocoder::Calculations.distance_between(coordinates[0], coordinates[1])
		if distance.nan?
			return distance = 0
		else
			distance = distance * 1.609347218694
			return distance.round(0)
		end
	end

	def get_coordinates
		coordinates = []

		coordinates.push(Geocoder.coordinates(locations[0]))
		coordinates.push(Geocoder.coordinates(locations[1]))
		coordinates
	end


end
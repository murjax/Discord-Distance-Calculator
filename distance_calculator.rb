require 'geocoder'
require_relative 'geocoder_configure.rb' # use your own configuration for geocoder

class DistanceCalculator

	attr_reader :locations

	def initialize(locations)
		@locations = locations
	end

	def get_miles
		coordinates = get_coordinates
		distance = Geocoder::Calculations.distance_between(coordinates[0], coordinates[1])

		return distance.nan? ? distance = 0 : distance.round(0)
		
		
	end

	def get_kilometers
		coordinates = get_coordinates
		distance = Geocoder::Calculations.distance_between(coordinates[0], coordinates[1])

		return distance.nan? ? distance = 0 : (distance * 1.609347218694).round(0) 
		
	end

	def get_coordinates
		coordinates = []
		coordinates.push(Geocoder.coordinates(locations[0])).push(Geocoder.coordinates(locations[1]))
	end


end
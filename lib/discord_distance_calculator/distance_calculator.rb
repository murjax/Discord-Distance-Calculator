module DiscordDistanceCalculator
  class DistanceCalculator
    attr_reader :locations

    def initialize(locations)
      @locations = locations
      Geocoder.configure(api_key: ENV['GEOCODER'])
    end

    def get_miles
      distance = get_distance
      distance.nan? ? 0 : distance.round(0)
    end

    def get_kilometers
      distance = get_distance
      distance.nan? ? 0 : (distance * 1.609347218694).round(0)
    end

    def get_distance
      coordinates = get_coordinates
      Geocoder::Calculations.distance_between(coordinates[0], coordinates[1])
    end

    def get_coordinates
      [Geocoder.coordinates(locations[0]),Geocoder.coordinates(locations[1])]
    end
  end
end

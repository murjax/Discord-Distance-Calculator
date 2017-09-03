module DiscordDistanceCalculator
  class MessageHandler
    attr_reader :message, :calculator

    def initialize(message)
      @message = message
      @calculator = DistanceCalculator.new(get_locations)
    end

    def has_command?
      message.start_with?('!distance')
    end

    def has_km?
      message.end_with?(' km')
    end

    def get_locations
      parts = message.split(" ")
      [parts[1], parts[2]]
    end

    def distance_calculator(unit_type = "mi")
      unit_type == "mi" ? calculator.get_miles : calculator.get_kilometers
    end

    def get_response
      response = "The distance between these two points is"
      if has_command?
        has_km? ? "#{response} #{distance_calculator("km")} kilometers." : "#{response} #{distance_calculator} miles."
      end
    end
  end
end

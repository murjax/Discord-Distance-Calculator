require 'spec_helper'

RSpec.describe DiscordDistanceCalculator::MessageHandler do
  let(:message) { "!distance 32084 04101 km" }
  let(:any_old_message) { "lorem ipsum" }
  let(:locations) { ["32084", "04101"] }
  let(:distance) { 1130 }
  let(:handler) { DiscordDistanceCalculator::MessageHandler.new(message) }
  let(:second_handler) { DiscordDistanceCalculator::MessageHandler.new(any_old_message) }

  context "when message is received with distance command" do
    it "finds distance command in message" do
      expect(handler.has_command?).to eq(true)
    end

    it "finds locations in message" do
      expect(handler.get_locations).to eq(locations)
    end

    it "uses DistanceCalculator object to calculate distance between objects" do
      expect(handler.distance_calculator).to be_within(5).of(distance)
    end

    it "finds kilometers parameter in message" do
      expect(handler.has_km?).to eq(true)
    end
  end

  context "when any old message is received" do
    it "examines message for distance command" do
      expect(second_handler.has_command?).to eq(false)
    end
  end
end

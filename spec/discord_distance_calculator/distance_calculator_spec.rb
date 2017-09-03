require "spec_helper"

RSpec.describe DiscordDistanceCalculator::DistanceCalculator do

  let(:zip_locations) { ["32084", "04101"] }
  let(:city_locations) { ["Saint Augustine, FL", "Portland, ME"] }
  let(:coord_locations) { ["29.9066163,-81.375338", "43.6800052,-70.3311296"] }
  let(:mix_locations) { ["29.9066163,-81.375338", "04101"] }
  let(:invalid_locations) { ["zxcvb", "bvcxz"] }
  let(:zip_calculator) { DiscordDistanceCalculator::DistanceCalculator.new(zip_locations) }
  let(:city_calculator) { DiscordDistanceCalculator::DistanceCalculator.new(city_locations) }
  let(:coord_calculator) { DiscordDistanceCalculator::DistanceCalculator.new(coord_locations) }
  let(:mix_calculator) { DiscordDistanceCalculator::DistanceCalculator.new(mix_locations) }
  let(:invalid_calculator) { DiscordDistanceCalculator::DistanceCalculator.new(invalid_locations) }

  context "when valid locations are received" do
    it "works with zip codes" do
      expect(zip_calculator.get_miles).to be_within(5).of(1130)
      expect(zip_calculator.get_kilometers).to be_within(5).of(1818)
    end

    it "works with cities" do
      expect(city_calculator.get_miles).to be_within(5).of(1130)
      expect(city_calculator.get_kilometers).to be_within(5).of(1818)
    end

    it "works with coordinates" do
      expect(coord_calculator.get_miles).to be_within(5).of(1130)
      expect(coord_calculator.get_kilometers).to be_within(5).of(1818)
    end

    it "works with mixed values" do
      expect(mix_calculator.get_miles).to be_within(5).of(1130)
      expect(mix_calculator.get_kilometers).to be_within(5).of(1818)
    end
  end

  context "when invalid content is received" do
    it "returns 0 if invalid locations are given" do
      expect(invalid_calculator.get_miles).to eq(0)
      expect(invalid_calculator.get_kilometers).to eq(0)
    end
  end
end

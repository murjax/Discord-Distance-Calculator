# coding utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "discord_distance_calculator/version"

Gem::Specification.new do |spec|
  spec.name = "discord_distance_calculator"
  spec.version = DiscordDistanceCalculator::VERSION
  spec.authors = ["Ryan Murphy"]
  spec.email = ["murjax@gmail.com"]

  spec.summary = %q{Discord bot for calculating distance}
  spec.description = %q{Discord Distance Calculator is a bot for calculating direct mileage between two geographic points}
  spec.homepage = "https://github.com/murjax/Discord-Distance-Calculator"
  spec.license = "MIT"
  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir = "bin"
  spec.executables = "discord_distance_bot"
  spec.require_paths = ["lib"]

  spec.add_dependency "discordrb"
  spec.add_dependency "geocoder"
  spec.add_dependency "dotenv"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
end

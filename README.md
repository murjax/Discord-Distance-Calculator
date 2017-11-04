# Discord Distance Calculator

# What does this do?
This is a simple gem that can be setup as a Discord bot to calculate the distance between two geographical points.
Distance can be returned in miles and kilometers.

# Installation
First install as a global gem.
```
gem install discord_distance_calculator
```
Navigate to your gem path. This will vary based on your ruby version and your ruby environment manager (rbenv or rvm).
For example on my machine with rbenv and ruby 2.4.1, it would be installed here:
```
~/.rbenv/versions/2.4.1/lib/ruby/gems/2.4.0/gems/discord_distance_calculator<version>
```
Create a `.env` file in this directory. Inside here you will need 3 API keys: A map service key for Geocoder (usually sourced from Google Maps API), a Discord token, and a Discord client id. Insert these into your `.env` file as the following variables:

```
GEOCODER=
DISCORD_TOKEN=
DISCORD_CLIENT_ID=
```

# Start your bot
Now you are ready to start your bot. This will run as a server, so open a new terminal or start it as a daemon.
`bundle exec discord_distance_calculator discord_distance_bot`

The distance calculator will now listen for ```!distance```  along with two parameters representing the two locations.

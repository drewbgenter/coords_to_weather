require 'open-uri'
require 'json'

class CoordsController < ApplicationController
  def fetch_weather
    @latitude = 37.8267
    @longitude = -122.423
    your_api_key = "814bdab2953220a1d81f8f79702dd5bd"

    # Your code goes here.
    url = "https://api.forecast.io/forecast/" + your_api_key + "/" + @latitude.to_s + "," + @longitude.to_s
    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)
    @temperature = parsed_data["currently"]["temperature"]
    @minutely_summary = parsed_data["minutely"]["summary"]
    @hourly_summary = parsed_data["hourly"]["summary"]
    @daily_summary = parsed_data["daily"]["summary"]
  end
end

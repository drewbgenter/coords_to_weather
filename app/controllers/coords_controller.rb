require 'open-uri'
require 'json'

class CoordsController < ApplicationController

  def fetch_weather

    if params[:address] == nil
        @address = "the corner of foster and sheriden"
    else
        @address = params[:address]
    end
        @url_safe_address = URI.encode(@address)

    # Your code goes here.
    url1 = "http://maps.googleapis.com/maps/api/geocode/json?address=" + @url_safe_address + "&sensor=false"
    raw_data1 = open(url1).read
    parsed_data1 = JSON.parse(raw_data1)
    @latitude = parsed_data1["results"][0]["geometry"]["location"]["lat"]
    @longitude = parsed_data1["results"][0]["geometry"]["location"]["lng"]

    #@latitude = 37.8267
    #@longitude = -122.423
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

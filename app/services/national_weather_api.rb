# frozen_string_literal: true

require 'net/http'
# This service accesses the National Weather API to obtain the forcast data using the Latitude
# and Longitude from the Geocoder API
class NationalWeatherApi
  def initialize(latlong)
    @lat = latlong[:lat]
    @long = latlong[:long]
  end

  def weather_by_lat_long
    # Get the point metadata
    uri = URI("https://api.weather.gov/points/#{@lat},#{@long}")
    response = Net::HTTP.get_response(uri)
    puts "response = #{response}"
    puts "response.class = #{response.class}"
    get_forcast_data(response)
  end

  def get_forcast_data(response)
    if !response.to_s.include?('HTTPNotFound')
      # Parse the JSON response
      point_data = JSON.parse(response.body)

      # Extract the forecast URL
      forecast_url = point_data['properties']['forecast']

      # Get the forecast
      forecast_response = Net::HTTP.get_response(URI(forecast_url))
      forecast_data = JSON.parse(forecast_response.body)
    else
      forecast_data = nil
    end
    forecast_data
  end
end

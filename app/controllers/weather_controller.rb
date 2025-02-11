# frozen_string_literal: true

# This controller takes the User input data and formats an address that is used to get the
# the forecast data that is then displayed in the view.
class WeatherController < ApplicationController
  def dashboard
    return if session[:address].blank?

    latlong_api = GeocoderApi.new(session[:address])
    latlong = latlong_api.lat_long_from_address
    @display_name = latlong_api.display_name_from_address
    @forecast_data = get_forecast_data(latlong)
  end

  def address
    session[:address] = ''
    param_array = load_param_array(params)
    format_address(param_array) if param_array.length.positive?
    redirect_back_or_to weather_dashboard_path
  end

  private

  def get_forecast_data(latlong)
    @from_cache = true
    Rails.cache.fetch("#{latlong[:lat]}#{latlong[:long]}", expires_in: 30.minutes, race_condition_ttl: 10.seconds) do
      @from_cache = false
      weather_api = NationalWeatherApi.new(latlong)
      weather_api.weather_by_lat_long
    end
  end

  def format_address(param_array)
    param_array.each do |param|
      session[:address] = if session[:address].blank?
                            param
                          else
                            "#{session[:address]},#{param}"
                          end
    end
  end

  def load_param_array(params)
    param_array = []
    param_array.push(params['city']) unless params['city'].blank?
    param_array.push(params['state']) unless params['state'].blank?
    param_array.push(params['zip']) unless params['zip'].blank?
    param_array
  end
end

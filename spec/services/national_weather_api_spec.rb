# frozen_string_literal: true

RSpec.describe NationalWeatherApi, type: :model do
  describe '#weather_by_lat_long' do
    # lat/long for Boston Mass
    let(:latlong1) { { lat: 42.3554, long: -71.0605 } }
    let(:weather_api1) { NationalWeatherApi.new(latlong1) }
    it 'returns the weather for a US address' do
      forecast_data = weather_api1.weather_by_lat_long
      #  Boston should have a weather forecast
      expect(forecast_data).not_to eq(nil)
    end
    # lat/long for Hong Kong
    let(:latlong2) { { lat: 22.3506, long: 111.1849 } }
    let(:weather_api2) { NationalWeatherApi.new(latlong2) }
    it 'does not return the weather for a non-US address' do
      forecast_data = weather_api2.weather_by_lat_long
      #  Hong Kong should not have a weather forecast
      expect(forecast_data).to eq(nil)
    end
  end
end

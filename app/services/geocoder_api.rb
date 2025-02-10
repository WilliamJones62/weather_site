# frozen_string_literal: true

require 'geocoder'
# This service accesses the Geocoder API to obtain the Latitude, Longitude and display
# address using the user input data
class GeocoderApi
  def initialize(address)
    @address = address
  end

  def lat_long_from_address
    # Get the point metadata
    @display_name = ' '
    results = Geocoder.search(@address)
    if results
      latlong = { lat: results.first.coordinates[0].round(4), long: results.first.coordinates[1].round(4) }
      @display_name = results.first.display_name
    else
      latlong = nil
    end

    latlong
  end

  def display_name_from_address
    # Get the point metadata
    display_name = ' '
    results = Geocoder.search(@address)
    display_name = results.first.display_name if results

    display_name
  end
end

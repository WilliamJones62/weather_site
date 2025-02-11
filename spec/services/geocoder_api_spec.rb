# frozen_string_literal: true

RSpec.describe GeocoderApi, type: :model do
  let(:latlong_api) { GeocoderApi.new('Lorton,VA,22079') }
  describe '#lat_long_from_address' do
    it 'returns the latitude and longitutude for an address' do
      latlong = latlong_api.lat_long_from_address
      expect(latlong[:lat]).to eq(38.7043)
      expect(latlong[:long]).to eq(-77.2203)
    end
  end
  describe '#display_name_from_address' do
    it 'returns the full address for an user input address' do
      display_name = latlong_api.display_name_from_address
      expect(display_name).to eq('Lorton, Fairfax County, Virginia, 22079, United States')
    end
  end
end

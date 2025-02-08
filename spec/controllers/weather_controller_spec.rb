require 'rails_helper'
require 'spec_helper'
describe WeatherController, :type => :controller do
    it "renders the dashboard template" do
        get "/dashboard"
        expect(response).to be_successful
    end
 end
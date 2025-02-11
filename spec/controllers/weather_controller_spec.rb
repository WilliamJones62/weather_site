# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'
RSpec.describe 'Weather', type: :request do
  describe 'GET root' do
    it 'renders the dashboard template' do
      get 'http://localhost:3000'
      expect(response).to be_successful
    end
  end
  describe 'GET weather/dashboard' do
    it 'renders the dashboard template' do
      get 'http://localhost:3000/weather/dashboard'
      expect(response).to be_successful
    end
  end
  describe 'POST weather/address' do
    it 'renders the dashboard template after redirect' do
      post 'http://localhost:3000/weather/address', params: { 'authenticity_token' => '[FILTERED]', 'city' => 'Lorton', 'state' => 'VA', 'zip' => '22079', 'commit' => 'Get The Forecast' }
      expect(response).to have_http_status(302)
    end
  end
  describe 'POST weather/address' do
    it 'renders the dashboard template after redirect' do
      post 'http://localhost:3000/weather/address', params: { 'authenticity_token' => '[FILTERED]', 'city' => 'Lorton', 'state' => 'VA', 'zip' => '22079', 'commit' => 'Get The Forecast' }
      expect(response).to redirect_to(weather_dashboard_path)
    end
  end
end

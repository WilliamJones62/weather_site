# National Weather

National Weather takes a user input address, converts it to latitude and longitude coordinates, obtains the weather forecast for that location, and returns it to the user. 

## Installation

Clone this repo via:

```
git clone git@github.com:WilliamJones62/weather_site.git
```

## Dependencies

* Ruby version 3.0.3

* Rails version 7.0.4.3

* APIs
    * Geocoder
    * NOAA National Weather Service

    Currently neither of these APIs require API keys and are free to use.

## Usage

To run the application locally enter the following commands in the root directory (weather_site):

```
bundle
rails s
```

The application is available in the browser at localhost:3000

## User Instructions

The user can enter any combination of City, State, and Zip code and press the Get The Forecast button. If a valid US address is entered a 7 day weather forcast (starting today) showing day time and evening temperature and short forecast information. If an invalid address is entered a message is displayed encouraging the user to enter a valid US address. Forecast data for valid addresses is cached for 30 minutes. If cached data is returned to the user the phrase 'FROM CACHE' is appended to the address shown in the forecast data.

## Test Suite

In the test directory run the command 'bundle exec rspec'

## License

The repo is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
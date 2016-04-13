require 'sabre/version'
require 'sabre/error'
require 'rest-client'

module Sabre
  autoload :Configuration, 'sabre/configuration'
  autoload :Credentials, 'sabre/credentials'
  autoload :Client, 'sabre/client'
  autoload :Base, 'sabre/base'
  autoload :JSON, 'sabre/json'
  autoload :BasePost, 'sabre/base_post'

  module API
    autoload :InstaFlightsSearch, 'sabre/api/insta_flights_search'
    autoload :LeadPriceCalendar,'sabre/api/lead_price_calendar'
    autoload :DestinationFinder, 'sabre/api/destination_finder'
    autoload :FlightsTo, 'sabre/api/flights_to'
    autoload :LowFareForecast, 'sabre/api/low_fare_forecast'
    autoload :FareRange, 'sabre/api/fare_range'
    autoload :TravelSeasonality, 'sabre/api/travel_seasonality'
    autoload :TopDestinations, 'sabre/api/top_destinations'
    autoload :LowFareHistory, 'sabre/api/low_fare_history'
    autoload :PointOfSaleCountryCodeLookup, 'sabre/api/point_of_sale_country_code_lookup'
    autoload :TravelSeasonalityAirportsLookup, 'sabre/api/travel_seasonality_airports_lookup'
    autoload :CountriesLookup, 'sabre/api/countries_lookup'
    autoload :CityPairsLookup, 'sabre/api/city_pairs_lookup'
    autoload :TravelThemeLookup, 'sabre/api/travel_theme_lookup'
    autoload :MultiAirportCityLookup, 'sabre/api/multi_airport_city_lookup'
    autoload :AirportsAtCitiesLookup, 'sabre/api/airports_at_cities_lookup'
    autoload :AirlineAllianceLookup, 'sabre/api/airline_alliance_lookup'
    autoload :AircraftEquipmentLookup, 'sabre/api/aircraft_equipment_lookup'
    autoload :AirlineLookup, 'sabre/api/airline_lookup'
    autoload :GeoAutocomplete, 'sabre/api/geo_autocomplete'
    autoload :BargainFinderMax, 'sabre/api/bargain_finder_max'
    autoload :AlternateAirportShop, 'sabre/api/alternate_airport_shop'
    autoload :AlternateDate, 'sabre/api/alternate_date'
    autoload :AdvancedCalendarSearch, 'sabre/api/advanced_calendar_search'
    autoload :SeatMap, 'sabre/api/seat_map'
    autoload :CarAvailability, 'sabre/api/car_availability'
    autoload :GeoCode, 'sabre/api/geo_code'
    autoload :GeoSearch, 'sabre/api/geo_search'
  end

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  def self.client
    @client ||= Client.new
  end
end

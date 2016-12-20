require 'sacs_ruby/version'
require 'sacs_ruby/error'
require 'rest-client'

module SacsRuby
  autoload :Configuration, 'sacs_ruby/configuration'
  autoload :Credentials, 'sacs_ruby/credentials'
  autoload :Client, 'sacs_ruby/client'
  autoload :Base, 'sacs_ruby/base'
  autoload :JSON, 'sacs_ruby/json'
  autoload :BasePost, 'sacs_ruby/base_post'

  module API
    autoload :InstaFlightsSearch, 'sacs_ruby/api/insta_flights_search'
    autoload :LeadPriceCalendar,'sacs_ruby/api/lead_price_calendar'
    autoload :DestinationFinder, 'sacs_ruby/api/destination_finder'
    autoload :FlightsTo, 'sacs_ruby/api/flights_to'
    autoload :LowFareForecast, 'sacs_ruby/api/low_fare_forecast'
    autoload :FareRange, 'sacs_ruby/api/fare_range'
    autoload :TravelSeasonality, 'sacs_ruby/api/travel_seasonality'
    autoload :TopDestinations, 'sacs_ruby/api/top_destinations'
    autoload :LowFareHistory, 'sacs_ruby/api/low_fare_history'
    autoload :PointOfSaleCountryCodeLookup, 'sacs_ruby/api/point_of_sale_country_code_lookup'
    autoload :TravelSeasonalityAirportsLookup, 'sacs_ruby/api/travel_seasonality_airports_lookup'
    autoload :CountriesLookup, 'sacs_ruby/api/countries_lookup'
    autoload :CityPairsLookup, 'sacs_ruby/api/city_pairs_lookup'
    autoload :TravelThemeLookup, 'sacs_ruby/api/travel_theme_lookup'
    autoload :MultiAirportCityLookup, 'sacs_ruby/api/multi_airport_city_lookup'
    autoload :AirportsAtCitiesLookup, 'sacs_ruby/api/airports_at_cities_lookup'
    autoload :AirlineAllianceLookup, 'sacs_ruby/api/airline_alliance_lookup'
    autoload :AircraftEquipmentLookup, 'sacs_ruby/api/aircraft_equipment_lookup'
    autoload :AirlineLookup, 'sacs_ruby/api/airline_lookup'
    autoload :GeoAutocomplete, 'sacs_ruby/api/geo_autocomplete'
    autoload :BargainFinderMax, 'sacs_ruby/api/bargain_finder_max'
    autoload :AlternateAirportShop, 'sacs_ruby/api/alternate_airport_shop'
    autoload :AlternateDate, 'sacs_ruby/api/alternate_date'
    autoload :AdvancedCalendarSearch, 'sacs_ruby/api/advanced_calendar_search'
    autoload :SeatMap, 'sacs_ruby/api/seat_map'
    autoload :CarAvailability, 'sacs_ruby/api/car_availability'
    autoload :GeoCode, 'sacs_ruby/api/geo_code'
    autoload :GeoSearch, 'sacs_ruby/api/geo_search'
    autoload :GetHotelDescriptiveInfo, 'sacs_ruby/api/get_hotel_descriptive_info'

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

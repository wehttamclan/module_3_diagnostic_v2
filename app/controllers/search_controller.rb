class SearchController < ApplicationController
  def index
    zipcode = params[:q]

    station_search = StationSearch.new(zipcode)

    @stations = station_search.stations
  end
end
class SearchController < ApplicationController
  def index
    conn = Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?location=80203&fuel_type=ELEC,LPG&limit=10") do
      faraday.headers["X-Api-Key"] = "#{ENV["nrel_api_key"]}"
      faraday.adapter Faraday.default_adapter
    end
    

    @stations 
  end
end
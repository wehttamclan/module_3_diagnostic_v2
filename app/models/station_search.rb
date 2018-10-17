class StationSearch
  attr_reader :zipcode

  def initialize(zipcode)
    @zipcode = zipcode
  end

  def stations
    station_list.each do |station_data|
      Station.new(station_data)
    end
  end

  def station_list
    endpoint = JSON.parse(response.body, symbolize_names: true)
    endpoint[:fuel_stations]
  end
  
  def response
    conn.get("/api/alt-fuel-stations/v1/nearest.json?location=#{zipcode}&fuel_type=ELEC,LPG&limit=10")
  end

  def conn
    Faraday.new(url: "https://developer.nrel.gov") do |faraday|
      faraday.headers["X-Api-Key"] = "#{ENV["nrel_api_key"]}"
      faraday.adapter Faraday.default_adapter
    end
  end
end
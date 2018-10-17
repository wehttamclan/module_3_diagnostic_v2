class StationSearch
  attr_reader :zipcode

  def initialize(zipcode)
    @zipcode = zipcode
  end

  def station_list
    response = conn.get("/api/alt-fuel-stations/v1/nearest.json?location=#{zipcode}&fuel_type=ELEC,LPG&limit=10")
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://developer.nrel.gov") do |faraday|
      faraday.headers["X-Api-Key"] = "#{ENV["nrel_api_key"]}"
      faraday.adapter Faraday.default_adapter
    end
  end
end
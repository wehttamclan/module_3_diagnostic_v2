class Station
  attr_reader :name, :address, :type, :distance, :access_time
  def initialize(station_data)
    @station_data = station_data
    @name = station_data[:station_name]
    @address = address
    @type = station_data[:fuel_type_code]
    @distance = distance
    @access_time = station_data[:access_days_time]
  end

  def address
    @station_data[:street_address] + ', ' + @station_data[:city] + ', ' + @station_data[:state] + ' ' + @station_data[:zip]
  end

  def distance
    @station_data[:distance].to_s + ' miles'
  end
end
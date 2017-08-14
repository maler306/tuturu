class Search < ApplicationRecord

  def self.find_routes(departure_station, arrival_station)
    @departure_station = RailwayStation.find(departure_station)
    @arrival_station = RailwayStation.find(arrival_station)
    @routes = @departure_station.routes & @arrival_station.routes
    @routes = @routes.select{ |route| @departure_station.attr_in(:position, route) < @arrival_station.attr_in(:position, route) }
  end

  def self.find_trains(departure_station, arrival_station)
    @routes = find_routes(departure_station, arrival_station)
    Train.joins(:route).where('route_id' => @routes.pluck(:id))
  end

end

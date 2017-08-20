class RailwayStation < ApplicationRecord
  validates :title, presence: true

  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :trains, foreign_key: :current_station_id
  has_many :tickets_as_departure, class_name: 'Ticket', foreign_key: :departure_station_id
  has_many :tickets_as_arrival, class_name: 'Ticket', foreign_key: :arrival_station_id

  scope :ordered, -> { joins(:railway_stations_routes).order('railway_stations_routes.position').uniq }

  def update_station_attr(attribute, route, args)
    station_route = station_route(route)
    station_route.update(attribute.to_sym => args) if station_route
  end

  def attr_in(attribute, route)
    value = station_route(route).try(attribute.to_sym)
    return unless value
    RailwayStationsRoute.columns_hash[attribute.to_s].type.eql?(:time) ? value.strftime('%H:%M') : value
  end

  def station_route(route)
    @station_route = railway_stations_routes.where(route: route).first
  end

end

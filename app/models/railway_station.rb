class RailwayStation < ApplicationRecord
  validates :title, presence: true

  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :trains, foreign_key: :current_station_id
  has_many :tickets_as_departure, class_name: 'Ticket', foreign_key: :departure_station_id
  has_many :tickets_as_arrival, class_name: 'Ticket', foreign_key: :arrival_station_id


end

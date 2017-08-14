class Ticket < ApplicationRecord
  validates :name, :surname, :doc_type, :doc_number, :doc_expire, presence: true

  belongs_to :user
  belongs_to :train
  belongs_to :departure_station, class_name: 'RailwayStation', foreign_key: :departure_station_id
  belongs_to :arrival_station, class_name: 'RailwayStation', foreign_key: :arrival_station_id
end

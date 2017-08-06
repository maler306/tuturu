class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :tickets
  has_many :carriages, dependent: :destroy

    def sum_seats_by_type(carriage, type_seat)
      carriages.where(type: carriage).sum(type_seat)
    end

    def sort_carriages
      sort_flag ? carriages : carriages.reverse
    end

end

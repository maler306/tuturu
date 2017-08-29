class AddRouteRefRailwayStationRefToTrains < ActiveRecord::Migration[5.1]
  def change
    add_reference :trains, :route, foreign_key: true
    add_reference :trains, :current_station, foreign_key: {to_table: :railway_stations}
  end
end

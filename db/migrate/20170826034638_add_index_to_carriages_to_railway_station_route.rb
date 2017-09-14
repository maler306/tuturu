class AddIndexToCarriagesToRailwayStationRoute < ActiveRecord::Migration[5.1]
  def change
    add_index :carriages, [:id, :type]
    add_index :railway_stations_routes, [:railway_station_id, :route_id], unique: true, name: "index_unique_pair_of_stations_and_routes"
  end
end

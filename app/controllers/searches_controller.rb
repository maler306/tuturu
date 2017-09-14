class SearchesController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @railway_stations = RailwayStation.all
  end

  def show
    @railway_stations = RailwayStation.all
    @arrival_station = RailwayStation.find(params[:arrival_station])
    @departure_station = RailwayStation.find(params[:departure_station])
    @trains = Search.find_trains(params[:departure_station], params[:arrival_station])
  end

end

class WelcomeController < ApplicationController
  def index
    @railway_stations = RailwayStation.all
  end
end

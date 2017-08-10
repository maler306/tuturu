class SearchesController < ApplicationController

  def new
    @railway_stations = RailwayStation.all
    render text: params
  end

  def create

  end

  def show
    render text: params
  end

  def edit
  end

end

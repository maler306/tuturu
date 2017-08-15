class RailwayStationsController < ApplicationController
  before_action :set_railway_station, only: [:show, :edit, :update, :destroy, :update_position, :update_arrival_time, :update_departure_time,  :update_station_attr]
  before_action :set_route, only: [:update_position, :update_arrival_time, :update_departure_time, :update_station_attr]

  def index
    @railway_stations = RailwayStation.all
  end

  def show
  end

  def new
    @railway_station = RailwayStation.new
  end

  def edit
  end

  def create
    @railway_station = RailwayStation.new(railway_station_params)

      if @railway_station.save
        redirect_to @railway_station, notice: 'Станция была успешно создана.'
      else
        render :new
      end
  end

  def update
      if @railway_station.update(railway_station_params)
        redirect_to @railway_station, notice: 'Станция была успешно обновлена.'
      else
        render :edit
      end
  end

  def destroy
    @railway_station.destroy
    respond_to do |format|
      redirect_to railway_stations_path, notice: 'Станция была успешно удалена.'
    end
  end

  # def update_position
  #   @railway_station.update_station_attr(:position, @route, params[:position])
  #   redirect_to @route
  # end

  # def update_arrival_time
  #   @railway_station.update_station_attr(:arrival_time, @route, params[:arrival_time])
  #   redirect_to @route
  # end

  # def update_departure_time
  #   @railway_station.update_station_attr(:departure_time, @route, params[:departure_time])
  #   redirect_to @route
  # end
   def update_station_attr
    attribute = params[:attribute]
    @railway_station.update_station_attr(attribute.to_sym, @route, params[attribute.to_sym])
    redirect_to @route
   end

  private

    def set_railway_station
      @railway_station = RailwayStation.find(params[:id])
    end

    def set_route
      @route = Route.find(params[:route_id])
    end

    def railway_station_params
      params.require(:railway_station).permit(:title, :position, :arrival_time, :departure_time)
    end
end

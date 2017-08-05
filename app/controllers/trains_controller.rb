class TrainsController < ApplicationController
  before_action :set_train, only: [:show, :edit, :update, :destroy]

  def index
    @trains = Train.all
  end

  def show
    @carriages = @train.carriages
    @economys = @carriages.where(type: Carriage::TYPE.keys[0].to_s)
    @coupes = @carriages.where(type: Carriage::TYPE.keys[1].to_s)
    @premium = @carriages.where(type: Carriage::TYPE.keys[2].to_s)
    @sedentary = @carriages.where(type: Carriage::TYPE.keys[3].to_s)
  end

  def new
    @train = Train.new
  end

  def edit
  end

  def create
    @train = Train.new(train_params)
      if @train.save
        redirect_to @train, notice: 'Поезд был успешно создан.'
      else
        render :new
      end
  end

  def update
      if @train.update(train_params)
        redirect_to @train, notice: 'Поезд успешно обновлен.'
      else
        render :edit
      end
  end

  def destroy
    @train.destroy
      redirect_to trains_path, notice: 'Поезд удален.'
  end

  private

    def set_train
      @train = Train.find(params[:id])
    end

    def train_params
      params.require(:train).permit(:number, :current_station_id, :route_id)
    end
end

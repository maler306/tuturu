class CarriagesController < ApplicationController
  before_action :set_carriage, only: [:show, :edit, :update, :destroy]

  def show
    @train = Train.find(params[:train_id])
  end

  def new
    @train = Train.find(params[:train_id])
    @carriage = Carriage.new
  end

  def edit
    @train = Train.find(params[:train_id])
  end

  def create
    @train = Train.find(params[:train_id])
    @carriage = @train.carriages.new(carriage_params)

    if @carriage.save
      redirect_to @train, notice: 'Вагон был успешно создан.'
    else
      render :new
    end
  end

  def update
   @train = Train.find(params[:train_id])
    if @carriage.update(carriage_params)
      redirect_to @train, notice: 'Вагон был успешно обновлен'
    else
      render :edit
    end
  end

  def destroy
    @train = Train.find(params[:train_id])
    @carriage.destroy
    redirect_to @train, notice: 'Вагон удален'
  end

  private

  def set_carriage
    @carriage = Carriage.find(params[:id])
  end

  def carriage_params
    params.require(:carriage).permit(:carriage_type, :bottom_seats, :top_seats, :number)
  end
end

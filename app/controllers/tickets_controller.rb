class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :destroy]

  def index
    @tickets = current_user.tickets
  end

  def new
    @train = Train.find( params[:train_id])
    @departure_station = RailwayStation.find(params[:departure_station_id])
    @arrival_station = RailwayStation.find(params[:arrival_station_id])
    @ticket = Ticket.new
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)
    if @ticket.save
      redirect_to @ticket
    else
      @train = @ticket.train
      @departure_station = @ticket.departure_station
      @arrival_station = @ticket.arrival_station
      render :action => "new", locals: {params: @ticket}
    end
  end

  def show
  end

  def destroy
    @ticket.destroy
      redirect_to tickets_path, notice: 'Билет удален.'
  end

  private
  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:train_id, :departure_station_id, :arrival_station_id, :name, :surname, :doc_type, :doc_number, :doc_expire)
  end
end

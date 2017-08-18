class TicketsController < ApplicationController
  # before_action :authenticate_user!, only: :create
  before_action :set_ticket, only: [:show, :destroy]

  def index
    @tickets = current_user.tickets
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)
    if @ticket.save
      redirect_to @ticket
    else
      render :new
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

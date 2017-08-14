class TicketsController < ApplicationController
before_action :set_ticket, only: [:show, :destroy]

  def index
  end

  def new
    @ticket = Ticket.new
  end

  def create
      @ticket = Ticket.new(ticket_params)
      if @ticket.save
        redirect_to @ticket
      else
        render :new
      end
  end

  def show
  end

  def destroy
  end

  private
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    def ticket_params
      params.require(:ticket).permit(:user_id, :train_id, :departure_station_id, :arrival_station_id, :name, :surname, :doc_type, :doc_number, :doc_expire)
    end
end

class Admin::TicketsController < Admin::BaseController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @tickets = Ticket.all
  end

  def show
  end

  def new
    @ticket = Ticket.new
  end

  def edit
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      redirect_to  [:admin, @ticket] # не работает /факт ticket_path/@ticket
    else
      render :new
    end
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to [:admin, @ticket], notice: 'Билет успешно обновлен'
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to admin_tickets_path, notice: 'Билет удален'
  end

  private
  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def set_user
    @user = @ticket.user
  end

  def ticket_params
    params.require(:ticket).permit(:user_id, :train_id, :departure_station_id, :arrival_station_id, :name, :surname, :doc_type, :doc_number, :doc_expire)
  end
end

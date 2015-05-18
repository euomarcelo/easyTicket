class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy, :buy]

  respond_to :html

  def index
    @tickets = Ticket.all
    respond_with(@tickets)
  end

  def show
    respond_with(@ticket)
  end

  def new
    @ticket = Ticket.new
    respond_with(@ticket)
  end

  def edit
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.save
    respond_with(@ticket)
  end

  def update
    @ticket.update(ticket_params)
    respond_with(@ticket)
  end

  def destroy
    @ticket.destroy
    respond_with(@ticket)
  end
  
  def buy
    @ticket.update_attribute(:active, false)
    current_user.decrement(:balance, @ticket.price)
    current_user.save
  end
  
  def search
    @tickets = Ticket.search(params['name'])
    respond_with(@tickets) do |format|
      format.html { render :action => :index }
    end
    
  end

  private
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    def ticket_params
      params.require(:ticket).permit(:user_id, :event_name, :event_date, :event_description, :active, :price)
    end
end

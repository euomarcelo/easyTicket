class OffersController < ApplicationController
  before_filter :authenticate_user! 
  before_action :set_offer, only: [:show, :edit, :update, :destroy, :buy]

  respond_to :html

  def index
    @offers = Offer.all
    respond_with(@offers)
  end

  def show
    respond_with(@offer)
  end

  def new
    @offer = Offer.new
    respond_with(@offer)
  end

  def edit
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.save
    respond_with(@offer)
  end

  def update
    @offer.update(offer_params)
    respond_with(@offer)
  end

  def destroy
    @offer.destroy
    respond_with(@offer)
  end
  
  def buy
    @offer.update_attribute(:is_active, false)
    current_user.decrement(:balance, @offer.actual_price)
    current_user.save
  end
  
  def search
    @offers = Offer.search(params['name'])
    respond_with(@offers) do |format|
      format.html { render :action => :index }
    end
    
  end

  private
    def set_offer
      @offer = Offer.find(params[:id])
    end

    def offer_params
      params.require(:offer).permit(:user_id, :event_name, :event_date, :event_description, :is_active, :starting_price, :actual_price, :expire_date, :is_auction)
    end
end

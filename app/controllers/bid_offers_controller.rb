class BidOffersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_bid_offer, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @bid_offers = BidOffer.all
    respond_with(@bid_offers)
  end

  def show
    respond_with(@bid_offer)
  end

  def new
    @bid_offer = BidOffer.new
    @bid_offer.offer_id = params[:offer]
    @bid_offer.user_id = current_user.id
    
    
    respond_with(@bid_offer)
  end

  def edit
  end

  def create
    @bid_offer = BidOffer.new(bid_offer_params)
    
    
    @offer = Offer.find(@bid_offer.offer_id)
    if @bid_offer.value <= @offer.actual_price
      redirect_to offers_url
    else
      @offer.update_attribute(:actual_price, @bid_offer.value)
      @user = User.find(@bid_offer.user_id)
      @user.update_attribute(:balance, @user.balance - @bid_offer.value)
      @bid_offer.save
      respond_with(@bid_offer)
    end
  end

  def update
    @bid_offer.update(bid_offer_params)
    respond_with(@bid_offer)
  end

  def destroy
    @bid_offer.destroy
    respond_with(@bid_offer)
  end

  private
    def set_bid_offer
      @bid_offer = BidOffer.find(params[:id])
    end

    def bid_offer_params
      params.require(:bid_offer).permit(:user_id, :offer_id, :value )
    end
end

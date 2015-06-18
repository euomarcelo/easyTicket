class BidOffersController < ApplicationController
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
    @offer = Offer.find(params[:offer])
    @bid_offer = BidOffer.new()
    respond_with(@bid_offer)
  end

  def edit
  end

  def create
    @bid_offer = BidOffer.new(bid_offer_params)
    @bid_offer.save
    respond_with(@bid_offer)
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
      params.require(:bid_offer).permit(:user_id, :offer_id, :value)
    end
end

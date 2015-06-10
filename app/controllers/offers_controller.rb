class OffersController < ApplicationController
  respond_to :html

  def new
    @offer = Offer.new
    respond_with(@offer)
  end

  def search
    @offers = Offer.search params[:search]
  end
end

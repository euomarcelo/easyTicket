class OfferController < ApplicationController
  def new
  end
  
  def search
    @offers = Offer.search params[:search]
  end
end

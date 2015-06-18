class OffersController < ApplicationController
  before_filter :authenticate_user!, :except => [:show_all]
  before_action :set_offer, only: [:show, :edit, :update, :destroy, :buy]

  respond_to :html

  def index
    @offers = Offer.all
    respond_with(@offers)
  end

  def show_all
    @offers = Offer.limit(5).order('event_date asc')
    #@response = {:offers => @offers, :featuredOffers => @featuredOffers}
    respond_with(@offers)
  end

  def show
    respond_with(@offer)
  end

  def new
    @offer = Offer.new
    @offer.update_attribute(:isApproved, false)
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
    current_user.balance -= @offer.actual_price
    @offer.is_active = false
    begin
      ActiveRecord::Base.transaction do
        current_user.save!
        @offer.save!
      end
    rescue
      redirect_to offers_path, alert: "Saldo insuficiente"
    end
  end

  def approve
    @offer = Offer.find(params[:id])
    @offer.update_attribute(:isApproved, true)
    redirect_to offers_path
  end

  def search
    @offers = Offer.search(params['name'])
    respond_with(@offers) do |format|
      format.html { render :action => :index }
    end

  end

  def finish_auction
    @offer = Offer.find(params[:id])
    @bid_offers = BidOffer.where(:offer_id => @offer.id)

    @better_bid = 0

    @bid_offers.each do |bid_offer|
      if bid_offer.value > @better_bid
        @better_bid = bid_offer.value
      end
    end

    @offer.update_attribute(:actual_price, @better_bid)
    @offer.update_attribute(:is_active, false)
  end

  def report
    report = UserReport.new
    render template: 'dossier/reports/show', locals: {report: report.run}
  end

  private
    def set_offer
      @offer = Offer.find(params[:id])
    end

    def offer_params
      params.require(:offer).permit(:user_id, :event_name, :event_date, :event_description, :is_active, :starting_price, :actual_price, :expire_date, :is_auction)
    end
end

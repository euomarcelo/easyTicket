class Offer < ActiveRecord::Base
    has_many :purchases
    has_many :bid_offers
end

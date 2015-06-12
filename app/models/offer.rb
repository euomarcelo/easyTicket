class Offer < ActiveRecord::Base
    belongs_to :users
    has_many :purchases
    has_many :bid_offers
    
    def self.search(name)
        search = "%" + name + "%"
        Offer.where("event_name LIKE ?", search) 
    end

end

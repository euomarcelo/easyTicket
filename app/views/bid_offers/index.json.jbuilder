json.array!(@bid_offers) do |bid_offer|
  json.extract! bid_offer, :id, :user_id, :offer_id, :value
  json.url bid_offer_url(bid_offer, format: :json)
end

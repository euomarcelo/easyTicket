json.array!(@offers) do |offer|
  json.extract! offer, :id, :user_id, :event_name, :event_date, :event_description, :is_active, :starting_price, :actual_price, :expire_date, :is_auction
  json.url offer_url(offer, format: :json)
end

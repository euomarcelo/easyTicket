json.array!(@purchases) do |purchase|
  json.extract! purchase, :id, :user_id, :offer_id, :paid_value, :is_cancelled
  json.url purchase_url(purchase, format: :json)
end

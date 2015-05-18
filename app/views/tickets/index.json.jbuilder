json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :user_id, :event_name, :event_date, :event_description, :active, :price
  json.url ticket_url(ticket, format: :json)
end

json.array!(@pila_packs) do |pila_pack|
  json.extract! pila_pack, :id, :name, :real_value, :pila_value
  json.url pila_pack_url(pila_pack, format: :json)
end

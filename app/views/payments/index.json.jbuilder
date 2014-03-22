json.array!(@payments) do |payment|
  json.extract! payment, :id, :invoice_id, :payment_type_id, :ammount, :created_by_id
  json.url payment_url(payment, format: :json)
end

json.array!(@payments) do |payment|
  json.extract! payment, :id, :invoice_id, :payment_type_id, :amount, :created_by_id, :notes
  json.url payment_url(payment, format: :json)
end

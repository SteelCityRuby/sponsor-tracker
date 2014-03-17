json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :sponsor_id, :package_type_id
  json.url invoice_url(invoice, format: :json)
end

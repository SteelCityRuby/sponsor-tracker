json.array!(@invoice_addon_line_items) do |invoice_addon_line_item|
  json.extract! invoice_addon_line_item, :id, :invoice_id, :package_addon_type_id, :quantity
  json.url invoice_addon_line_item_url(invoice_addon_line_item, format: :json)
end

json.extract! @invoice, :id, :name, :total, :created_at, :updated_at

json.sponsor do
  json.extract! @invoice.sponsor, :name, :address
end

json.line_items do
  json.base_package do
    json.extract! @invoice.package_type, :name, :price
  end

  json.optional_packages @invoice.invoice_addon_line_items do |line_item|
    json.item line_item.package_addon_type.name
    json.rate line_item.package_addon_type.price
    json.extract! line_item, :quantity, :price
  end
end

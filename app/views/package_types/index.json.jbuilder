json.array!(@package_types) do |package_type|
  json.extract! package_type, :id, :name, :price, :addons_allowed, :tickets, :total_spots
  json.url package_type_url(package_type, format: :json)
end

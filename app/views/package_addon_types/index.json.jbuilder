json.array!(@package_addon_types) do |package_addon_type|
  json.extract! package_addon_type, :id, :name, :price, :total_spots
  json.url package_addon_type_url(package_addon_type, format: :json)
end

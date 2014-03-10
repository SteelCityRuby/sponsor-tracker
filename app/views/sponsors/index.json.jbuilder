json.array!(@sponsors) do |sponsor|
  json.extract! sponsor, :id, :name, :state
  json.url sponsor_url(sponsor, format: :json)
end

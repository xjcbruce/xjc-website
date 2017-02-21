json.array! @cities do |city|
  json.code city.gb_code
  json.name city.name
end

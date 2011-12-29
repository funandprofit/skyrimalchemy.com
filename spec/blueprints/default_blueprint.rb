Sham.define do
  name       { Forgery::Name.company_name }
  game_id    { Forgery::Basic.hex_color }
  uesp_link  { "http://#{Forgery::Internet.domain_name}/index.html" }
  base_value { Forgery::Basic.number }
  magnitude  { Forgery::Basic.number }
  weight     { Forgery::Monetary.money }

  positive(:unique => false) { true }
end

Effect.blueprint do
  name
  game_id
  uesp_link
  positive
  base_value
  magnitude
end

Ingredient.blueprint do
  name
  game_id
  uesp_link
  base_value
  weight
end

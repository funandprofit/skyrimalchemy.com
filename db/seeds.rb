Effect.transaction do
  Effect.destroy_all
  Effect.import
end

Ingredient.transaction do
  Ingredient.destroy_all
  Ingredient.import
end

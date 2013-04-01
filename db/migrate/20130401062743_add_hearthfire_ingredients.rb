class AddHearthfireIngredients < ActiveRecord::Migration
  def up
    hearthfire = Dlc.find_or_create_by_name('Hearthfire')

     [
      {
        name: 'Hawk\'s Egg',
        game_id: 'xx00f1cc',
        uesp_link: 'http://www.uesp.net/wiki/Skyrim:Hawk%27s_Egg',
        base_value: 5,
        weight: 0.5,
        effects: [ 'Resist Magic', 'Damage Magicka Regen', 'Waterbreathing', 'Lingering Damage Stamina' ],
        location: 'Added in the Hearthfire DLC, Hawk\'s Eggs are white eggs that can be found in hawk nests. Such nests can be found on the roof of Heljarchen Hall and Lakeview Manor.'
      },
      {
        name: 'Salmon Roe',
        game_id: 'xx003545',
        uesp_link: 'http://www.uesp.net/wiki/Skyrim:Salmon_Roe',
        base_value: 5,
        weight: 0.2,
        effects: [ 'Restore Stamina', 'Waterbreathing', 'Fortify Magicka', 'Regenerate Magicka' ],
        location: 'Added in the Hearthfire DLC, Salmon Roe look like small orange pearls on a wooden plate. They can be found in player-built homes or by harvesting jumping salmon. The waterfalls of White River are an especially good place to find jumping salmon.'
      },
    ].each do |ingredient_properties|
      effect_names = ingredient_properties.delete(:effects)
      ingredient   = Ingredient.create(ingredient_properties.merge(dlc_id: hearthfire.id))
      ingredient.effects = Effect.where(name: effect_names)
    end
  end

  def down
    hearthfire = Dlc.find_by_name('Hearthfire')
    hearthfire.destroy
  end
end

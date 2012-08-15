class AddDawnguardIngredients < ActiveRecord::Migration
  def up
    dawnstar = Dlc.find_or_create_by_name('Dawnguard')

    [
      {
        name: 'Ancestor Moth Wing',
        game_id: 'xx0059ba',
        uesp_link: 'http://www.uesp.net/wiki/Skyrim:Ancestor_Moth_Wing',
        base_value: 2,
        weight: 0.1,
        effects: [ 'Damage Stamina', 'Fortify Conjuration', 'Damage Magicka Regen', 'Fortify Enchanting' ],
        location: 'Added in the Dawnguard DLC, Ancestor Moth Wings are wings that can be harvested from Ancestor Moths. These moths can be only found in Ancestor Glade, east of Falkreath along the southern border of Skyrim. Ancestor Moths cannot be harvested for their wings while they are flying, only when they have landed.',
      },
      {
        name: 'Chaurus Hunter Antennae',
        game_id: 'xx0183b7',
        uesp_link: 'http://www.uesp.net/wiki/Skyrim:Chaurus_Hunter_Antennae',
        base_value: 2,
        weight: 0.1,
        effects: [ 'Damage Stamina', 'Fortify Conjuration', 'Damage Magicka Regen', 'Fortify Enchanting' ],
        location: 'Added in the Dawnguard DLC, Chaurus Hunter Antennae are dropped by Chaurus Hunters and Chaurus Hunter Fledglings. These insect-like creatures can, like normal Chaurus, be found in caves and dungeons all over Skyrim.',
      },
      {
        name: 'Gleamblossom',
        game_id: 'xx00b097',
        uesp_link: 'http://www.uesp.net/wiki/Skyrim:Gleamblossom',
        base_value: 5,
        weight: 0.1,
        effects: [ 'Resist Magic', 'Fear', 'Regenerate Health', 'Paralysis' ],
        location: 'Added in the Dawnguard DLC, Gleamblossom is a purple and blue flower. They can be found in caves and other dark places; there are especially large collection of Gleamblossom in Darkfall Passage and Forgotten Vale, both of which can be accessed through Darkfall Cave, north of Markarth.',
      },
      {
        name: 'Poison Bloom',
        game_id: 'xx0185fb',
        uesp_link: 'http://www.uesp.net/wiki/Skyrim:Poison_Bloom',
        base_value: 5,
        weight: 0.25,
        effects: [ 'Damage Health', 'Slow', 'Fortify Carry Weight', 'Fear' ],
        location: 'Added in the Dawnguard DLC, Poison Bloom is a purple flower which can only be found in Darkfall Cave, north of Markarth. If not immediately picked, it will release a poisonous gas when someone is near.',
      },
      {
        name: 'Yellow Mountain Flower',
        game_id: 'xx002a78',
        uesp_link: 'http://www.uesp.net/wiki/Skyrim:Yellow_Mountain_Flower',
        base_value: 2,
        weight: 0.1,
        effects: [ 'Resist Poison', 'Fortify Restoration', 'Fortify Health', 'Damage Stamina Regen' ],
        location: 'Added in the Dawnguard DLC, Yellow Mountain Flower look the same as blue, purple and red mountain flowers, but with yellow flowers instead. A really good spot for Yellow Mountain Flowers is in Ancestor Glade, east of Falkreath.',
      }
    ].each do |ingredient_properties|
      effect_names = ingredient_properties.delete(:effects)
      ingredient   = Ingredient.create(ingredient_properties.merge(dlc_id: dawnstar.id))
      ingredient.effects = Effect.where(name: effect_names)
    end
  end

  def down
    dawnstar = Dlc.find_by_name('Dawnguard')
    dawnstar.destroy
  end
end

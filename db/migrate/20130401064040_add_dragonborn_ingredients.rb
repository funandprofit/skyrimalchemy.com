class AddDragonbornIngredients < ActiveRecord::Migration
  def up
    dragonborn = Dlc.find_or_create_by_name('Dragonborn')

     [
      {
        name: 'Ash Creep Cluster',
        game_id: 'xx01cd74',
        uesp_link: 'http://www.uesp.net/wiki/Dragonborn:Ash_Creep_Cluster',
        base_value: 20,
        weight: 0.25,
        effects: [ 'Damage Stamina', 'Invisibility', 'Resist Fire', 'Fortify Destruction' ],
        location: 'Added in the Dragonborn DLC, Ash Creep Cluster is a yellow cluster similar in appearance (but not color) to the normal Creep Cluster. They can be found exclusively in Solstheim. There\'s one right outside of Bloodskal Barrow, accessible from Raven Rock Mine, and another one in Raven Rock Mine itself.'
      },
      {
        name: 'Ash Hopper Jelly',
        game_id: 'xx01cd71',
        uesp_link: 'http://www.uesp.net/wiki/Dragonborn:Ash_Hopper_Jelly',
        base_value: 20,
        weight: 0.25,
        effects: [ 'Restore Health', 'Fortify Light Armor', 'Resist Shock', 'Weakness to Frost' ],
        location: 'Added in the Dragonborn DLC, Ash Hopper Jelly is a red substance in an ornamented stone bowl. They are normally dropped by Ash Hoppers, which are found in southern Solstheim. There\'s one sample of the jelly downstairs in Severin Manor in Raven Rock.'
      },
      {
        name: 'Ashen Grass Pod',
        game_id: 'xx016e26',
        uesp_link: 'http://www.uesp.net/wiki/Dragonborn:Ashen_Grass_Pod',
        base_value: 1,
        weight: 0.1,
        effects: [ 'Resist Fire', 'Weakness to Shock', 'Fortify Lockpicking', 'Fortify Sneak' ],
        location: 'Added in the Dragonborn DLC, Ashen Grass Pod is harvested from spiky grass plants all over Solstheim. There is a sample of the pods downstairs in Severin Manor in Raven Rock.'
      },
      {
        name: 'Boar Tusk',
        game_id: 'xx01cd6f',
        uesp_link: 'http://www.uesp.net/wiki/Dragonborn:Boar_Tusk',
        base_value: 20,
        weight: 0.5,
        effects: [ 'Fortify Stamina', 'Fortify Health', 'Fortify Block', 'Frenzy' ],
        location: 'Added in the Dragonborn DLC, Boar Tusks are long tusks dropped by Bristlebacks and the Rieklings that ride them. There are plenty of tusks in Bristleback Cave, south of Northshore Landing in Solstheim.'
      },
      {
        name: 'Burnt Spriggan Wood',
        game_id: 'xx01cd6e',
        uesp_link: 'http://www.uesp.net/wiki/Dragonborn:Burnt_Spriggan_Wood',
        base_value: 20,
        weight: 0.5,
        effects: [ 'Weakness to Fire', 'Fortify Alteration', 'Damage Magicka Regen', 'Slow' ],
        location: 'Added in the Dragonborn DLC, Burnt Spriggan Wood are dropped by Burnt Spriggans. These creatures can be found in the ashlands of southern Solstheim.'
      },
      {
        name: 'Emperor Parasol Moss',
        game_id: 'xx01ff75',
        uesp_link: 'http://www.uesp.net/wiki/Dragonborn:Emperor_Parasol_Moss',
        base_value: 1,
        weight: 0.25,
        effects: [ 'Damage Health', 'Fortify Magicka', 'Regenerate Health', 'Fortify Two-handed' ],
        location: 'Added in the Dragonborn DLC, Emperor Parasol Moss are plants growing from Emperor Parasol mushrooms. The mushrooms can be found near Tel Mithryn in southeastern Solstheim.'
      },
      {
        name: 'Felsaad Tern Feathers',
        game_id: 'xx03cd8e',
        uesp_link: 'http://www.uesp.net/wiki/Dragonborn:Felsaad_Tern_Feathers',
        base_value: 15,
        weight: 0.1,
        effects: [ 'Restore Health', 'Fortify Light Armor', 'Cure Disease', 'Resist Magic' ],
        location: 'Added in the Dragonborn DLC, Felsaad Tern Feathers are feathers found on Felsaad Tern birds. The birds are likely to drop one to three feathers, and can be found anywhere in Solstheim but especially along Felsaad Coast. There are also feathers in Caerellius House in the Raven Rock docks and downstairs of Ienth Farm in Raven Rock.'
      },
      {
        name: 'Netch Jelly',
        game_id: 'xx01cd72',
        uesp_link: 'http://www.uesp.net/wiki/Dragonborn:Netch_Jelly',
        base_value: 20,
        weight: 0.5,
        effects: [ 'Paralysis', 'Fortify Carry Weight', 'Restore Stamina', 'Fear' ],
        location: 'Added in the Dragonborn DLC, Netch Jelly is a bluish substance inside a stone bowl. It is dropped by Netch, jellyfish-like creatures that can be found in groups of three to five near water in the southern regions of Solstheim. There are a couple of samples of jelly in Raven Rock Mine as well.'
      },
      {
        name: 'Scathecraw',
        game_id: 'xx017e97',
        uesp_link: 'http://www.uesp.net/wiki/Dragonborn:Scathecraw',
        base_value: 1,
        weight: 0.1,
        effects: [ 'Ravage Health', 'Ravage Stamina', 'Ravage Magicka', 'Lingering Damage Health' ],
        location: 'Added in the Dragonborn DLC, Scathecraw are dark purple plants that can be harvested. The plant can be found in Solstheim areas covered in ash. There are many plants downstairs in Ienth Farm in Raven Rock.'
      },
      {
        name: 'Spawn Ash',
        game_id: 'xx01cd6d',
        uesp_link: 'http://www.uesp.net/wiki/Dragonborn:Spawn_Ash',
        base_value: 20,
        weight: 0.1,
        effects: [ 'Ravage Stamina', 'Resist Fire', 'Fortify Enchanting', 'Ravage Magicka' ],
        location: 'Added in the Dragonborn DLC, Spawn Ash is a grey substance in a tan bowl. It is normally dropped by Ash Spawn, which randomly spawn in ashy areas of Solstheim and can also be found in Raven Rock Temple and during the March of the Dead quest.'
      },
      {
        name: 'Trama Root',
        game_id: 'xx017008',
        uesp_link: 'http://www.uesp.net/wiki/Dragonborn:Trama_Root',
        base_value: 1,
        weight: 0.2,
        effects: [ 'Weakness to Shock', 'Fortify Carry Weight', 'Damage Magicka', 'Slow' ],
        location: 'Added in the Dragonborn DLC, Trama Root are dead-looking roots that can be harvested from spikey-looking plants growing in the ash-covered parts of Solstheim. There are a bunch of Trama Roots in Severin Manor in Raven Rock as well.'
      },
    ].each do |ingredient_properties|
      effect_names = ingredient_properties.delete(:effects)
      ingredient   = Ingredient.create(ingredient_properties.merge(dlc_id: dragonborn.id))
      ingredient.effects = Effect.where(name: effect_names)
    end
  end

  def down
    dragonborn = Dlc.find_by_name('dragonborn')
    dragonborn.destroy
  end

end

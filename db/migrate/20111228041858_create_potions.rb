class CreatePotions < ActiveRecord::Migration
  def change
    create_table :potions do |t|

      t.timestamps
    end
  end
end

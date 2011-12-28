class CreateEffects < ActiveRecord::Migration
  def change
    create_table :effects do |t|

      t.timestamps
    end
  end
end

class CreateEffects < ActiveRecord::Migration
  def change
    create_table :effects do |t|
      t.string     :name, :game_id, :uesp_link
      t.boolean    :positive, :null => false, :default => true
      t.integer    :base_value, :magnitude, :null => false, :default => 0
      t.timestamps
    end
  end
end

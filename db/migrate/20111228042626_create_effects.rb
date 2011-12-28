class CreateEffects < ActiveRecord::Migration
  def change
    create_table :effects do |t|
      t.string     :name, :game_id, :uesp_link
      t.boolean    :positive, :null => false, :default => true
      t.timestamps
    end
  end
end

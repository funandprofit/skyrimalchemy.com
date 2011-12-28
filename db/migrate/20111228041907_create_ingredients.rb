class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string     :name, :game_id, :uesp_link
      t.integer    :base_value, :null => false, :default => 0
      t.float      :weight,     :null => false, :default => 0.0
      t.timestamps
    end
  end
end

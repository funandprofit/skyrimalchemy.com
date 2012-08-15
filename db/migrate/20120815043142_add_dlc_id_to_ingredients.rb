class AddDlcIdToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :dlc_id, :integer
  end
end

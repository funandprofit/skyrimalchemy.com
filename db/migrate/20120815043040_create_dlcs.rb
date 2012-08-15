class CreateDlcs < ActiveRecord::Migration
  def change
    create_table :dlcs do |t|
      t.string     :name, null: false
      t.timestamps
    end
  end
end

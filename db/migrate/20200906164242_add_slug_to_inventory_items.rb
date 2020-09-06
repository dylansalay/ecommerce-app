class AddSlugToInventoryItems < ActiveRecord::Migration[6.0]
  def change
    add_column :inventory_items, :slug, :string
    add_index :inventory_items, :slug, unique: true
  end
end

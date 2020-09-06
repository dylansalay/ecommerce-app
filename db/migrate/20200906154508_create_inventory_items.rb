class CreateInventoryItems < ActiveRecord::Migration[6.0]
  def change
    create_table :inventory_items do |t|
      t.string :title
      t.text :body
      t.decimal :unit_cost

      t.timestamps
    end
  end
end

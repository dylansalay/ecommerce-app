class AddCategoryReferenceToInventoryItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :inventory_items, :category, foreign_key: true
  end
end

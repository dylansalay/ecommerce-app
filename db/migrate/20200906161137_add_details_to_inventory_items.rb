# frozen_string_literal: true

class AddDetailsToInventoryItems < ActiveRecord::Migration[6.0]
  def change
    add_column :inventory_items, :subtitle, :string
    add_column :inventory_items, :main_image, :text
    add_column :inventory_items, :thumb_image, :text
  end
end

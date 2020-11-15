# frozen_string_literal: true

class ChangeInventoryItemMainImageToArray < ActiveRecord::Migration[6.0]
  def change
    change_column :inventory_items, :main_image, :text, array: true, default: [], using: 'main_image::text[]'
  end
end

# frozen_string_literal: true

class RenameInventoryItemMainImageToImages < ActiveRecord::Migration[6.0]
  def change
    rename_column :inventory_items, :main_image, :images
  end
end

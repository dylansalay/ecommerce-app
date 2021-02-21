# frozen_string_literal: true

class AddInventoryItemReferenceToStyles < ActiveRecord::Migration[6.0]
  def change
    add_reference :styles, :inventory_item, foreign_key: true
  end
end

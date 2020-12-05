# frozen_string_literal: true

class CreateShoppingCartItem < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_cart_items do |t|
      t.belongs_to :inventory_item, null: false
      t.belongs_to :shopping_cart, null: false
      t.integer :quantity, default: 0, null: false

      t.timestamps
    end
  end
end

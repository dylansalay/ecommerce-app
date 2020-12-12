# frozen_string_literal: true

class AddTitleToShoppingCartItem < ActiveRecord::Migration[6.0]
  def change
    add_column :shopping_cart_items, :title, :string
  end
end

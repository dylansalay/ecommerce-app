# frozen_string_literal: true

class ShoppingCartItem < ApplicationRecord
  belongs_to :inventory_item, class_name: 'InventoryItem', foreign_key: :inventory_item_id
  belongs_to :shopping_cart, class_name: 'ShoppingCart', foreign_key: :shopping_cart_id

  validates :inventory_item, :shopping_cart, :quantity, presence: true
  validates :quantity, numericality: { greater_than: 0 }

  def total_cost
    inventory_item.unit_cost * quantity
  end
end

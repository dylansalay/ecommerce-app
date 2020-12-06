# frozen_string_literal: true

class ShoppingCart < ApplicationRecord
  has_many :cart_items, class_name: "ShoppingCartItem", foreign_key: :shopping_cart_id
  has_many :inventory_items, through: :items, class_name: "InventoryItem"
  belongs_to :user

  validates_presence_of :user

  def add_item_to_cart(item, quantity = 1)
    existing_item = cart_items.find_by(inventory_item_id: item.id)
    if existing_item.present?
      prev_quantity = existing_item.quantity
      existing_item.update(quantity: (prev_quantity + quantity.to_i))
      self.save
    else
      new_item(item, quantity)
    end
  end

  def new_item(item, quantity)
    ShoppingCartItem.transaction do
      ShoppingCartItem.create!(
        shopping_cart: self,
        inventory_item: item,
        quantity: quantity,
      )
      self.save!
    end
  end
end

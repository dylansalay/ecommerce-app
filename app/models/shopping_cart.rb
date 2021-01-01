# frozen_string_literal: true

class ShoppingCart < ApplicationRecord
  has_many :cart_items, class_name: 'ShoppingCartItem', foreign_key: :shopping_cart_id
  has_many :inventory_items, through: :cart_items, class_name: 'InventoryItem'
  belongs_to :user

  validates_presence_of :user

  def add_item_to_cart(item, quantity = 1)
    existing_item = cart_items.find_by(inventory_item_id: item.id)
    if existing_item.present?
      prev_quantity = existing_item.quantity
      existing_item.update(quantity: (prev_quantity + quantity.to_i))
      save!
    else
      new_item(item, quantity)
    end
  end

  def new_item(item, quantity)
    ShoppingCartItem.transaction do
      ShoppingCartItem.create!(
        shopping_cart: self,
        inventory_item: item,
        title: item.title,
        quantity: quantity
      )
      save!
    end
  end

  def update_quantity(item, quantity)
    i = cart_items.find_by(inventory_item_id: item.id)
    if quantity.to_i.zero?
      i.delete
    else
      i.update(quantity: quantity)
    end
    save!
  end

  def remove_from_cart(item)
    cart_items.each  do |i|
      next unless i.id == item.id

      i.destroy
      item.destroy
      reload
    end
    save!
  end

  def cart_quantity
    self.cart_items.reduce(0) { |sum, item| sum + (item.quantity) }
  end

  def cart_subtotal
    cart_items.reduce(0) { |sum, item| sum + (item.quantity * item.inventory_item.unit_cost) }
  end

  def cart_shipping
    0
  end

  def cart_total
    cart_shipping + cart_subtotal
  end
end

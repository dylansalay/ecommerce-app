# frozen_string_literal: true

class AddBillingSameAsShippingToShoppingCarts < ActiveRecord::Migration[6.0]
  def change
    add_column :shopping_carts, :billing_same_as_shipping, :boolean, default: false
  end
end

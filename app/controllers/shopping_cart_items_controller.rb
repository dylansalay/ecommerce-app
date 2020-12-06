# frozen_string_literal: true

class ShoppingCartItemsController < ApplicationController
  before_action :load_inventory_item, only: %i[create]
  before_action :load_shopping_cart, only: %i[create]

  def create
    @shopping_cart.add_item_to_cart(@inventory_item, 1)

    redirect_to inventory_item_path(@inventory_item), notice: 'The item was added to your cart'
  end

  private

  def load_shopping_cart_item
    @cart_item = ShoppingCartItem.find(params[:id])
  end

  def load_inventory_item
    @inventory_item = InventoryItem.friendly.find(params[:format])
  end

  def load_shopping_cart
    @shopping_cart = current_user.shopping_carts.last
  end
end

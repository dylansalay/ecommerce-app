# frozen_string_literal: true

class ShoppingCartItemsController < ApplicationController
  before_action :load_inventory_item, only: %i[create update]
  before_action :load_shopping_cart, only: %i[create update destroy]
  before_action :load_shopping_cart_item, only: %i[destroy]

  def create
    @shopping_cart.add_item_to_cart(@inventory_item, params[:quantity], params[:style])
    respond_to do |format|
      if @shopping_cart.save
        format.html { redirect_to inventory_item_path(@inventory_item), notice: 'The item was added to your cart' }
      else
        format.html { render @inventory_item }
      end
    end
  end

  def update
    @shopping_cart.update_quantity(@inventory_item, params[:quantity])

    redirect_to shopping_carts_path, notice: 'The item quantity has been updated'
  end

  def destroy
    @shopping_cart.remove_from_cart(@cart_item)
    @cart_item.destroy if @cart_item['quantity'].zero?

    redirect_to shopping_carts_path, notice: 'The item was removed from your cart'
  end

  private

  def load_shopping_cart_item
    @cart_item = ShoppingCartItem.find(params[:id])
  end

  def load_inventory_item
    @inventory_item = InventoryItem.friendly.find(params[:id])
  end

  def load_shopping_cart
    @shopping_cart = current_or_guest_user.shopping_carts.last
  end
end

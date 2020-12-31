# frozen_string_literal: true

class ShoppingCartsController < ApplicationController
  before_action :load_shopping_cart, only: %i[index]
  layout 'inventory'

  def index
    @cart_items = @shopping_cart.cart_items
  end

  private

  def load_shopping_cart
    @shopping_cart = current_user.shopping_carts.where(purchased_at: nil).last
    redirect_to inventory_index_path if @shopping_cart.blank?
  end
end

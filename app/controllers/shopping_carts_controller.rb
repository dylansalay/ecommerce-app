# frozen_string_literal: true

class ShoppingCartsController < ApplicationController
  before_action :load_shopping_cart, only: %i[index edit]
  layout 'inventory'

  def index
    @cart_items = @shopping_cart.cart_items
  end

  def edit; end

  private

  def load_shopping_cart
    @shopping_cart = current_or_guest_user.shopping_carts.not_purchased.last
    redirect_to inventory_index_path if @shopping_cart.blank?
  end

  def shopping_cart_params
    params.require(:shopping_cart).permit(
      :name,
      shipping_address_attributes: %i[id name phone street1 street2 city state zipcode country],
      billing_address_attributes: %i[id name phone street1 street2 city state zipcode country]
    )
  end
end

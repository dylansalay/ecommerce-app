# frozen_string_literal: true

class ShoppingCartsController < ApplicationController
  before_action :load_shopping_cart, only: %i[index edit update]
  layout 'inventory'

  def index
    @cart_items = @shopping_cart.cart_items
  end

  def edit; end

  def update
    if @shopping_cart.update(shopping_cart_params)
      @shopping_cart.billing_address.assign_attributes(@shopping_cart.shipping_address.dup.attributes.except('id')) if @shopping_cart.billing_same_as_shipping?
      @shopping_cart.save
      redirect_to shopping_carts_path, notice: 'Please review your order details'
    else
      render :edit
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def load_shopping_cart
    @shopping_cart = current_or_guest_user.shopping_carts.not_purchased.last
    redirect_to inventory_index_path if @shopping_cart.blank?
    @shopping_cart.build_shipping_address unless @shopping_cart.shipping_address.present?
    @shopping_cart.build_billing_address unless @shopping_cart.billing_address.present?
  end

  def shopping_cart_params
    params.require(:shopping_cart).permit(
      :id, :name, :billing_same_as_shipping,
      shipping_address_attributes: %i[id name phone street1 street2 city state zipcode country],
      billing_address_attributes: %i[id name phone street1 street2 city state zipcode country]
    )
  end
end

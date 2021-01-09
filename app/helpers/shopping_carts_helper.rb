# frozen_string_literal: true

module ShoppingCartsHelper
  def load_shopping_cart
    @shopping_cart = current_or_guest_user.shopping_carts.where(purchased_at: nil).last
    redirect_to inventory_index_path if @shopping_cart.blank?
    @shopping_cart
  end
end

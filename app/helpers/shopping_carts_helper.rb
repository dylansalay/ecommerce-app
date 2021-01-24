# frozen_string_literal: true

module ShoppingCartsHelper
  def load_shopping_cart
    @shopping_cart = current_or_guest_user.shopping_carts.not_purchased.last
    redirect_to inventory_index_path if @shopping_cart.blank?
    @shopping_cart
  end

  def shopping_cart_link
    return if load_shopping_cart.cart_quantity.zero?
    if current_page?(shopping_carts_path)
      link_to "Check Out", edit_shopping_cart_path(load_shopping_cart), role: "menuitem", class: "bold btn btn-sm btn-primary"
    elsif current_page?(edit_shopping_cart_path(load_shopping_cart))
      link_to "Edit Cart", shopping_carts_path, role: "menuitem", class: "bold btn btn-sm btn-primary"
    else
      link_to "Proceed to Checkout", shopping_carts_path, role: "menuitem", class: "bold btn btn-sm btn-primary"
    end
  end
end

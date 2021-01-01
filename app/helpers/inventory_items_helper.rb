# frozen_string_literal: true

module InventoryItemsHelper
  def auth_dropdown_helper
    user_signed_in? ? current_user.name : 'Sign Up'
  end

  def image_generator(height:, width:)
    "https://placehold.it/#{height}x#{width}"
  end

  def inventory_img(img, type)
    if img
      img
    elsif type == 'thumb'
      image_generator(height: '350', width: '200')
    else
      image_generator(height: '600', width: '400')
    end
  end

  def inventory_badge_helper
    unless load_shopping_cart.cart_quantity.zero?
      load_shopping_cart.cart_quantity
    end
  end
end

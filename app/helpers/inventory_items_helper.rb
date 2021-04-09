# frozen_string_literal: true

module InventoryItemsHelper
  def auth_dropdown_helper
    user_signed_in? ? current_or_guest_user.name : 'Sign Up'
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

  def item_style(item) 
    options = ['Select Style', 'Add Style']
    if item.styles.any?
      styles = (options + item.styles.map{ |s| ["#{s.color + ', ' + s.stone}", s.id] })
    end
    
    select_tag(
      :style, 
      options_for_select(styles, "Select Style"), 
      data: { action: "change->inventory-item#select", "inventory-item-target"=>"select_dropdown" }
    )
  end

  def inventory_badge_helper
    load_shopping_cart.cart_quantity unless load_shopping_cart.cart_quantity.zero?
  end
end

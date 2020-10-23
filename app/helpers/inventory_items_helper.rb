# frozen_string_literal: true

module InventoryItemsHelper
  def auth_dropdown_helper
    user_signed_in? ? current_user.name : "Sign Up"
  end
end

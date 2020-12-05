# frozen_string_literal: true

class AddUserIdToShoppingCart < ActiveRecord::Migration[6.0]
  def change
    add_reference :shopping_carts, :user, foreign_key: true
  end
end

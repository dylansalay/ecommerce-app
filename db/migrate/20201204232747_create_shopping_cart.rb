# frozen_string_literal: true

class CreateShoppingCart < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_carts do |t|
      t.string :name
      t.datetime :purchased_at, default: nil

      t.timestamps
    end
  end
end

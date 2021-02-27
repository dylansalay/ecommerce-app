# frozen_string_literal: true

class CreateStyles < ActiveRecord::Migration[6.0]
  def change
    create_table :styles do |t|
      t.string :color
      t.string :stone
      t.string :length

      t.timestamps
    end
  end
end

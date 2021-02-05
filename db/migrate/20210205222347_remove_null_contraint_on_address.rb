# frozen_string_literal: true

class RemoveNullContraintOnAddress < ActiveRecord::Migration[6.0]
  def change
    change_column :addresses, :created_at, :datetime, null: true
    change_column :addresses, :updated_at, :datetime, null: true
  end
end

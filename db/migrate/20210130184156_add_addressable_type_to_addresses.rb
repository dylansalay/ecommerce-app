# frozen_string_literal: true

class AddAddressableTypeToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :addressable_type, :string
  end
end

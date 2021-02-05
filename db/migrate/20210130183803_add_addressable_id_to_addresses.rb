# frozen_string_literal: true

class AddAddressableIdToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :addressable_id, :integer
  end
end

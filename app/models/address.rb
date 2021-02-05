# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  def billing_same_as_shipping?
    true if billing_same_as_shipping
  end
end

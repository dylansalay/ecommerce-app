# frozen_string_literal: true

class ShoppingCart < ApplicationRecord
  has_many :inventory_items
  belongs_to :user

  validates_presence_of :user
end

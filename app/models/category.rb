# frozen_string_literal: true

class Category < ApplicationRecord
  validates :title, presence: true
  has_many :inventory_items
end

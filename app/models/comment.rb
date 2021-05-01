class Comment < ApplicationRecord
  belongs_to :inventory_item
  belongs_to :user
end

# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :inventory_item

  def can_delete?(user)
    true if user.name == user_name || user_name == "Guest User #{user.id}"
  end
end

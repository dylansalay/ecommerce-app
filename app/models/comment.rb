# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :inventory_item

  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :user_name, :content, presence: true

  def can_delete?(user)
    true if user.name == user_name || user_name == "Guest User #{user.id}"
  end

  def blank_stars
    5 - rating.to_i
  end
end

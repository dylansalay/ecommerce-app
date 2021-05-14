class Comment < ApplicationRecord
  belongs_to :inventory_item

  def can_delete?(user)
    true if user.name == self.user_name || self.user_name == "Guest User #{user.id}"
  end
end

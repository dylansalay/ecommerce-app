class InventoryItem < ApplicationRecord
  include Placeholder
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :category

  validates :title, presence: true
  validates :body, presence: true

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: '600',width: '400')
    self.thumb_image ||= Placeholder.image_generator(height: '350',width: '200')
  end
end

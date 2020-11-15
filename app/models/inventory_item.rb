# frozen_string_literal: true

class InventoryItem < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :category

  validates :title, presence: true
  validates :body, presence: true

  mount_uploader :thumb_image, ItemUploader
  mount_uploaders :images, ItemUploader
end

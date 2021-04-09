# frozen_string_literal: true

class InventoryItem < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :category
  belongs_to :shopping_cart, optional: true

  has_many :styles, dependent: :destroy, class_name: 'Style'

  accepts_nested_attributes_for :styles, allow_destroy: true

  validates :title, presence: true
  validates :body, presence: true

  mount_uploader :thumb_image, ItemUploader
  mount_uploaders :images, ItemUploader

  def styles_options_for_select
    options = []
    if styles.any?
      styles.each do |style|
        options << ["#{style.length} | #{style.color}" + (style.stone.present? ? " | #{style.stone}" : '')]
      end
    else
      options << 'One Style'
    end
    options
  end
end

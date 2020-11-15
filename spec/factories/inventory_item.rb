# frozen_string_literal: true

FactoryBot.define do
  sequence :title do |n|
    "title #{n}"
  end

  sequence :subtitle do |n|
    "subtitle #{n}"
  end

  factory :inventory_item do
    title { generate :title }
    body { Faker::Lorem.sentence }
    unit_cost { Faker::Commerce.price }
    subtitle { generate :subtitle }
    images { ['/assets/images/poppy_image_1', '/assets/images/poppy_image_2'] }
    thumb_image { '/assets/images/poppy_thumb' }
    category { FactoryBot.create(:category) }
  end
end

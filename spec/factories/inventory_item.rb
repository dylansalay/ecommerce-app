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
    main_image { Placeholder.image_generator(height: '600', width: '400') }
    thumb_image { Placeholder.image_generator(height: '350', width: '200') }
    category { FactoryBot.create(:category) }
  end
end
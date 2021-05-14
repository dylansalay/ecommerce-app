# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    inventory_item { nil }
    user { nil }
    content { 'MyText' }
  end
end

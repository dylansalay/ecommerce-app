# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    title { Faker::Ancient.titan }
  end
end

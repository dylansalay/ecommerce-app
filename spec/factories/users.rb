# frozen_string_literal: true

FactoryBot.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end

  factory :user do
    email { generate :email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password { 'asdfasdf' }
  end

  factory :admin_user, class: 'AdminUser' do
    email { generate :email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password { 'asdfasdf' }
  end
end

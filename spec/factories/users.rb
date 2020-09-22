# frozen_string_literal: true

FactoryBot.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end

  factory :user do
    email { generate :email }
    name { 'Jon Snow' }
    password { 'asdfasdf' }
  end

  factory :admin_user, class: 'AdminUser' do
    email { generate :email }
    name { 'Admin User' }
    password { 'asdfasdf' }
  end
end

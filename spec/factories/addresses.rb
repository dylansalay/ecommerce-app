# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    name { 'MyString' }
    street1 { 'MyString' }
    street2 { 'MyString' }
    city { 'MyString' }
    state { 'MyString' }
    zipcode { 'MyString' }
    country { 'MyString' }
    phone { 'MyString' }
  end
end

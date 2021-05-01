FactoryBot.define do
  factory :comment do
    inventory_item { nil }
    user { nil }
    content { "MyText" }
  end
end

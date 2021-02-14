# frozen_string_literal: true

User.create!(
  email: 'jonnysnow@email.com',
  password: 'testing123',
  password_confirmation: 'testing123',
  first_name: 'Jon',
  last_name: 'Snow',
  type: 'AdminUser',
  roles: 'site_admin'
)
puts ' 1 Admin User created'

3.times do |category|
  Category.create!(
    title: "Category #{category}"
  )
end

puts '3 Categories created'

3.times do |item|
  InventoryItem.create!(
    title: "Inventory Item #{item}",
    subtitle: "Inventory Item subtitle #{item}",
    body: 'lorem ipsum',
    unit_cost: item.to_s,
    images: ['https://placehold.it/600x400'],
    thumb_image: 'https://placehold.it/350x200',
    category_id: Category.last.id
  )
end

puts '10 Categories created'

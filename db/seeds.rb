3.times do |category|
  Category.create!(
    title: "Category #{category}"
  )
end

puts "3 Categories created"

10.times do |item|
  InventoryItem.create!(
    title: "Inventory Item #{item}",
    subtitle: "Inventory Item subtitle #{item}",
    body: "lorem ipsum",
    unit_cost: "#{item}",
    main_image: "https://placehold.it/600x400",
    thumb_image: "https://placehold.it/350x200",
    category_id: Category.last.id
  )
end

puts "10 Categories created"

10.times do |item|
  InventoryItem.create!(
    title: "Inventory Item #{item}",
    subtitle: "Inventory Item subtitle #{item}",
    body: "lorem ipsum",
    unit_cost: "#{item}",
    main_image: "https://placehold.it/600x400",
    thumb_image: "https://placehold.it/350x200"
  )
end
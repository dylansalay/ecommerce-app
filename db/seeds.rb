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

Category.create!(
  title: 'bracelet'
)
Category.create!(
  title: 'necklace'
)
Category.create!(
  title: 'anklet'
)

puts "3 Categories created | #{Category.all.map(&:title)} "

def seed_image(file_dir, file_name)
  File.open(File.join(Rails.root, "/app/assets/images/#{file_dir}/#{file_name}.jpg"))
end

InventoryItem.create!(
  title: 'the jasmine',
  subtitle: 'pearl gold chain bracelet',
  body: 'a simple chain bracelet featuring teardrop mother-of-pearl shell beads. a modern, feminine piece to add to your everyday stack of jewels or show off on its own.',
  unit_cost: 12,
  images: [seed_image('the jasmine', 'jasmine2'), seed_image('the jasmine', 'jasmine3'), seed_image('the jasmine', 'jasmine4'), seed_image('the jasmine', 'jasmine5'), seed_image('the jasmine', 'jasmine6')],
  thumb_image: seed_image('the jasmine', 'jasmine1'),
  category_id: Category.find_by(title: 'bracelet').id
)

InventoryItem.create!(
  title: 'the poppy',
  subtitle: 'gold statement chain bracelet',
  body: 'a simple chain bracelet with an edgy twist. adds dimension to your everyday stack of jewels, or, wears beautifully on its own.',
  unit_cost: 10,
  images: [seed_image('the poppy', 'poppy2'), seed_image('the poppy', 'poppy3'), seed_image('the poppy', 'poppy4'), seed_image('the poppy', 'poppy5'), seed_image('the poppy', 'poppy6'), seed_image('the poppy', 'poppy7'), seed_image('the poppy', 'poppy8')],
  thumb_image: seed_image('the poppy', 'poppy1'),
  category_id: Category.find_by(title: 'bracelet').id
)

InventoryItem.create!(
  title: 'the dahlia',
  subtitle: 'simple gold chain bracelet with pearl',
  body: 'a simple gold oval chain bracelet with a statement glass pearl that is sure to be a beautiful addition to your everyday stack of jewels.',
  unit_cost: 10,
  images: [seed_image('the dahlia', 'dahlia2'), seed_image('the dahlia', 'dahlia3'), seed_image('the dahlia', 'dahlia4'), seed_image('the dahlia', 'dahlia5'), seed_image('the dahlia', 'dahlia6'), seed_image('the dahlia', 'dahlia7'), seed_image('the dahlia', 'dahlia8')],
  thumb_image: seed_image('the dahlia', 'dahlia1'),
  category_id: Category.find_by(title: 'bracelet').id
)

InventoryItem.create!(
  title: 'the daisy',
  subtitle: 'gold chain bead bar bracelet',
  body: 'a simple gold chain bracelet with a bead bar that is sure to be a beautiful addition to your everyday stack of jewels.',
  unit_cost: 10,
  images: [seed_image('the daisy', 'daisy2'), seed_image('the daisy', 'daisy3'), seed_image('the daisy', 'daisy4'), seed_image('the daisy', 'daisy5'), seed_image('the daisy', 'daisy6'), seed_image('the daisy', 'daisy7'), seed_image('the daisy', 'daisy8'), seed_image('the daisy', 'daisy9'), seed_image('the daisy', 'daisy10')],
  thumb_image: seed_image('the daisy', 'daisy1'),
  category_id: Category.find_by(title: 'bracelet').id
)

puts "4 Items created | #{InventoryItem.all.map(&:title)} "

Style.create!(
  color: 'gold',
  stone: 'gold Bead',
  length: '6.75',
  inventory_item: InventoryItem.find_by(title: 'the daisy')
)
Style.create!(
  color: 'gold',
  stone: 'silver Bead',
  length: '6.75',
  inventory_item: InventoryItem.find_by(title: 'the daisy')
)
Style.create!(
  color: 'gold',
  stone: 'red Bead',
  length: '6.75',
  inventory_item: InventoryItem.find_by(title: 'the daisy')
)
Style.create!(
  color: 'gold',
  stone: 'yellow Bead',
  length: '6.75',
  inventory_item: InventoryItem.find_by(title: 'the daisy')
)
Style.create!(
  color: 'gold',
  stone: 'green Bead',
  length: '6.75',
  inventory_item: InventoryItem.find_by(title: 'the daisy')
)
Style.create!(
  color: 'gold',
  stone: 'teal Bead',
  length: '6.75',
  inventory_item: InventoryItem.find_by(title: 'the daisy')
)
Style.create!(
  color: 'gold',
  stone: 'white Bead',
  length: '6.75',
  inventory_item: InventoryItem.find_by(title: 'the daisy')
)
Style.create!(
  color: 'gold',
  stone: 'black Bead',
  length: '6.75',
  inventory_item: InventoryItem.find_by(title: 'the daisy')
)

puts "10 Styles created | #{Style.all.map(&:stone)} "

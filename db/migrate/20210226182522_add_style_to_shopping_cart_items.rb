class AddStyleToShoppingCartItems < ActiveRecord::Migration[6.0]
  def change
    add_column :shopping_cart_items, :style, :string, default: ''
  end
end

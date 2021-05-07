class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :inventory_item, null: false, foreign_key: true
      t.text :content
      t.string :user_name

      t.timestamps
    end
  end
end

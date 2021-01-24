class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :country
      t.string :phone

      t.timestamps
    end
  end
end

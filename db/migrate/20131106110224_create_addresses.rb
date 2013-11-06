class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :category
      t.integer :addressable_id
      t.string :addressable_type
      t.integer :country_id
      t.integer :state_id
      t.integer :city
      t.string :street1
      t.integer :street2
      t.integer :street3
      t.text :full_address

      t.timestamps
    end
    add_index :addresses, :country_id
    add_index :addresses, :state_id
    add_index :addresses, :city
    add_index :addresses, :addressable_id
  end
end

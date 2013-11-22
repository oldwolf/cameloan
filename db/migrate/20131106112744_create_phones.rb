class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :phonable_type
      t.integer :phonable_id
      t.string :category
      t.string :number

      t.timestamps
    end
    add_index :phones, :phonable_id

  end
end

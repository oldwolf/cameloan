class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.integer :tenant_id
      t.decimal :income

      t.timestamps
    end
    add_index :contacts, :tenant_id
  end
end

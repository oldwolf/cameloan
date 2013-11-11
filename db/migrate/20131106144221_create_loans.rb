class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.decimal :interest_rate
      t.decimal :interest_amount
      t.string :interest_type
      t.date :maturity_date
      t.integer :agent_id
      t.integer :debtor_id
      t.integer :collector_id
      t.references :tenant, index: true
      t.string :status

      t.timestamps
    end
    add_index :loans, :agent_id
    add_index :loans, :debtor_id
    add_index :loans, :collector_id
  end
end

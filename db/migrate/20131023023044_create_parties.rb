class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :name
      t.decimal :monthly_income, null: false, default: 0.0
      t.string :type
      t.references :tenant, index: true

      t.timestamps
    end
  end
end

class CreateLoanSchemes < ActiveRecord::Migration
  def change
    create_table :loan_schemes do |t|
      t.string :name
      t.text :description
      t.decimal :minimum_amount
      t.decimal :maximum_amount
      t.decimal :interest_rate, null: false, default: 12
      t.boolean :is_income_before_tax, null: false, default: true
      t.decimal :income, null: false, default: 1500
      t.boolean :need_income_statement
      t.integer :minimum_working_period, null: false, default: 6
      t.integer :working_period_unit_id
      t.integer :country_id
      t.integer :state_id
      t.integer :city_id
      t.integer :minimum_age_requirement, null: false, default: 20
      t.integer :maximum_age_requirement, null: false, default: 60
      t.integer :loan_period_unit_id
      t.integer :minimum_loan_period, null: false, default: 6
      t.integer :maximum_loan_period, null: false, default: 36
      t.boolean :need_mortgage, null: false, default: false
      t.boolean :need_guarantor, null: false, default: false
      t.integer :fastest_approval_day, null: false, default: 3
      t.boolean :pulished, null: false, default: true
      t.boolean :active, null: false, default: true
      t.datetime :start_at
      t.datetime :stop_at
      t.integer :tenant_id

      t.timestamps
    end
    add_index :loan_schemes, :income
    add_index :loan_schemes, :minimum_working_period
    add_index :loan_schemes, :working_period_unit_id
    add_index :loan_schemes, :country_id
    add_index :loan_schemes, :state_id
    add_index :loan_schemes, :city_id
    add_index :loan_schemes, :minimum_age_requirement
    add_index :loan_schemes, :maximum_age_requirement
    add_index :loan_schemes, :minimum_loan_period
    add_index :loan_schemes, :maximum_loan_period
    add_index :loan_schemes, :tenant_id
    add_index :loan_schemes, :need_mortgage
    add_index :loan_schemes, :need_guarantor
    add_index :loan_schemes, :interest_rate
  end
end

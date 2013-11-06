class CreateLoanSchemes < ActiveRecord::Migration
  def change
    create_table :loan_schemes do |t|
      t.string :name
      t.text :description
      t.date :maturity_date
      t.integer :agent_id
      t.integer :debtor_id
      t.integer :creditor_id
      t.decimal :maximum_amount
      t.decimal :interest_rate
      t.boolean :is_salary_before_tax
      t.decimal :salary_income
      t.boolean :need_salary_statement
      t.integer :minimum_working_period
      t.integer :minimum_working_period_unit_id
      t.integer :country_id
      t.integer :state_id
      t.integer :city_id
      t.integer :minimum_age_requirement
      t.integer :maximum_age_requirement
      t.integer :period_unit_id
      t.integer :minimum_period
      t.integer :maximum_period
      t.decimal :interest_rate
      t.decimal :interest_amount
      t.string :interest_type
      t.boolean :need_mortgage
      t.boolean :need_guarantor
      t.integer :fastest_approval_day
      t.integer :tenant_id

      t.timestamps
    end
    add_index :loan_schemes, :agent_id
    add_index :loan_schemes, :debtor_id
    add_index :loan_schemes, :creditor_id
    add_index :loan_schemes, :minimum_working_period
    add_index :loan_schemes, :country_id
    add_index :loan_schemes, :state_id
    add_index :loan_schemes, :city_id
    add_index :loan_schemes, :minimum_age_requirement
    add_index :loan_schemes, :maximum_age_requirement
    add_index :loan_schemes, :minimum_period
    add_index :loan_schemes, :maximum_period
    add_index :loan_schemes, :tenant_id
  end
end

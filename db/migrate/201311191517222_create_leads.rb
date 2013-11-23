class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :contact_name
      t.string :contact_phone
      t.string :contact_email
      t.string :contact_address
      t.decimal :contact_salary
      t.integer :contact_age
      t.integer :contact_borrow_amount
      t.integer :contact_loan_period
      t.string :status
      t.integer :tenant_id
      t.integer:loan_scheme_id
      t.timestamps
    end
    add_index :leads, :tenant_id
    add_index :leads, :loan_scheme_id
    add_index :leads, :status
  end
end

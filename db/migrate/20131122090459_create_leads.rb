class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :contact_name
      t.string :contact_email
      t.string :contact_phone
      t.integer :loan_scheme_id
      t.string :tenant_id

      t.timestamps
    end
    add_index :leads, :loan_scheme_id
    add_index :leads, :tenant_id
  end
end

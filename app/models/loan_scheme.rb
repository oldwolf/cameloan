class LoanScheme < ActiveRecord::Base
  acts_as_tenant :tenant

  belongs_to :tenant

  validates :name, presence: true, uniqueness: { scope: :tenant_id }, case_sensitive: false
end

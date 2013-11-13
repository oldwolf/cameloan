class LoanScheme < ActiveRecord::Base
  belongs_to :tenant

  validates :name, presence: true, uniqueness: { scope: :tenant_id }, case_sensitive: false
end

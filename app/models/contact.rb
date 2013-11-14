class Contact < ActiveRecord::Base
  acts_as_tenant :tenant

  belongs_to :tenant

  validates_uniqueness_to_tenant :name, case_sensitive: false
end

class Contact < ActiveRecord::Base
  acts_as_tenant :tenant

  belongs_to :tenant

  has_many :addresses, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :addresses, allow_destroy: true

  has_many :phones, as: :phonable, dependent: :destroy
  accepts_nested_attributes_for :phones, allow_destroy: true

  validates_uniqueness_to_tenant :name, case_sensitive: false
end

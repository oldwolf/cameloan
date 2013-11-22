class Tenant < ActiveRecord::Base
  has_many :users, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :loan_schemes, dependent: :destroy

  has_many :addresses, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :addresses, allow_destroy: true

  has_many :phones, as: :phonable, dependent: :destroy
  accepts_nested_attributes_for :phones, allow_destroy: true

  validates :name, uniqueness: true, presence: true
  validates :subdomain, uniqueness: true, presence: true
end

class Tenant < ActiveRecord::Base
  has_many :users, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :loan_schemes, dependent: :destroy

  validates :name, uniqueness: true, presence: true
  validates :subdomain, uniqueness: true, presence: true
end

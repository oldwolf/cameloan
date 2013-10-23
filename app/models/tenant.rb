class Tenant < ActiveRecord::Base
  has_many :users, dependent: :destroy

  validates :name, uniqueness: true, presence: true
  validates :subdomain, uniqueness: true, presence: true
end

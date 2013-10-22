class Tenant < ActiveRecord::Base
  has_many :users, dependant: :destroy
end

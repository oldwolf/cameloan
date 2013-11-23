class Lead < ActiveRecord::Base
  belongs_to :tenant
  validates :contact_name, presence: true
  validates :contact_phone, presence: true

  scope :pending, -> { where(status: "PENDING") }

  STATUS = [
    ["PENDING", "PENDING"],
    ["APPROVED", "APPROVED"]
  ]
end

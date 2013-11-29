class Loan < ActiveRecord::Base
  acts_as_tenant :tenant

  belongs_to :tenant

  before_create :generate_sequence_no

  def generate_sequence_no

  end
end

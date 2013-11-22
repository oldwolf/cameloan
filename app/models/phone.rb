class Phone < ActiveRecord::Base
  belongs_to :phonable, polymorphic: true
end

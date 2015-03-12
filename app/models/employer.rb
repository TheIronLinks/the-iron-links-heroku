class Employer < ActiveRecord::Base
  has_one :user, as: :userable
  has_many :locations
end

class Employer < ActiveRecord::Base
  has_one :user, as: :userable
  has_many :locations, dependent: :destroy
  geocoded_by :full_street_address
  after_validation :geocode
end

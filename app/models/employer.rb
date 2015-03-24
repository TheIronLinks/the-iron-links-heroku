class Employer < ActiveRecord::Base
  has_one :user, as: :userable
  has_many :locations, dependent: :destroy
  geocoded_by :full_street_address
  after_validation :geocode

  def graduate_favorites
    u = self.user
    f = GradEmplFavorite.where('employer_id = ?', u.id)
    r = []
    f.each do |favorite|
      g = Graduate.find(favorite.employer_id)
      r.push("#{g.first_name} #{g.last_name}")
    end
    return r
  end
end

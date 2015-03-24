class Graduate < ActiveRecord::Base
  has_one :user, as: :userable
  has_many :links
  has_many :experiences
  has_many :educations
  before_create :assign_region
  accepts_nested_attributes_for :links
  accepts_nested_attributes_for :educations
  accepts_nested_attributes_for :experiences

  def favorited_employers
    u = self.user
    f = GradEmplFavorite.where('graduate_id = ?', u.id)
    r = []
    f.each do |favorite|
      r.push(Employer.find(favorite.employer_id).name)
    end
    return r
  end

  REGIONS = {
    west: [
      'CO',
      'WY',
      'MT',
      'ID',
      'WA',
      'OR',
      'UT',
      'NV',
      'CA',
      'AK',
      'HI'
    ],
    southwest:[
      'TX',
      'OK',
      'NM',
      'AZ'
    ],
    northeast:[
      'ME',
      'MA',
      'RI',
      'CT',
      'NH',
      'VT',
      'NY',
      'PA',
      'NJ',
      'DE',
      'MD'
    ],
    southeast:[
      'WV',
      'VA',
      'KY',
      'TN',
      'NC',
      'SC',
      'GA',
      'AL',
      'MS',
      'AR',
      'LA',
      'FL'
    ],
    midwest: [
      'OH',
      'IN',
      'MI',
      'IL',
      'MO',
      'WI',
      'MN',
      'IA',
      'KS',
      'NE',
      'SD',
      'ND'
    ]
  }


  def check_region
    REGIONS.each{|key, value|
      return key.to_s if value.include?(self.present_state)
    }
  end

  def assign_region
    self.present_region = self.check_region
  end

  # def link_assignment(link)
  #   new_link = Link.new
  #   new_link.url = link[:url]
  #   self.links = [new_link]
  #   new_link.save
  # end

  # def user_assignment
  #   self.user = current_user
  #   self.email = current_user.email
  # end

  # def education_assignment(education)
  #   top_education = Education.new
  #   top_education.school_name = education[:school_name]
  #   top_education.concentration = education[:concentration]
  #   top_education.level = education[:level]
  #   self.educations = [top_education]
  #   top_education.save
  # end

  # def handle_side_objects(link, education)
  #   link_assignment(link)
  #   user_assignment()
  #   education_assignment(params[:education])
  #   # Handle Portfolio Link
  #   # Handle User Logic
  #   # Handle Education
  # end

  include Workflow

  workflow do
    state :opened do
      event :restrict, transitions_to: :restricted
      event :close, transitions_to: :closed
      event :limit, transitions_to: :limited
    end

    state :restricted do
      event :open, transitions_to: :opened
    end

    state :limited do
      event :open, transitions_to: :opened
      event :restrict, transitions_to: :restricted
      event :close, transitions_to: :closed
    end

    state :closed do
      event :limit, transitions_to: :limited
      event :restrict, transitions_to: :restricted
      event :open, transitions_to: :opened
    end
  end
end

class Location < ActiveRecord::Base
  belongs_to :employer
  has_many :job_listings, dependent: :destroy

  before_create :assign_region

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
    REGIONS.each do |key, value|
      return key.to_s if value.include?(self.state)
    end
  end

  def assign_region
    self.region = self.check_region
  end
end

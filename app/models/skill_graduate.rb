class SkillGraduate < ActiveRecord::Base
  belongs_to :skill
  belongs_to :graduate
end

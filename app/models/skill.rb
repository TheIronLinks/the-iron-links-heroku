class Skill < ActiveRecord::Base
  has_many :skill_graduates
  has_many :graduates, through: :skill_graduates
end

class Graduate < ActiveRecord::Base
  has_one :user, as: :userable
  has_many :links
  has_many :experiences
  has_many :educations
  accepts_nested_attributes_for :links, allow_destroy: true
  accepts_nested_attributes_for :educations, allow_destroy: true
  accepts_nested_attributes_for :experiences, allow_destroy: true

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

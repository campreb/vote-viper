class Election < ActiveRecord::Base
  has_many :questions
  has_many :responders
  validates :title, presence: true

  accepts_nested_attributes_for :questions, allow_destroy: true
end

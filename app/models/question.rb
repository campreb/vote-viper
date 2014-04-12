class Question < ActiveRecord::Base
  belongs_to :election
  has_many :options
  validates :title, presence: true

  accepts_nested_attributes_for :options, allow_destroy: true
end

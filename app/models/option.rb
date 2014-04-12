class Option < ActiveRecord::Base
  belongs_to :question

  validates :name, presence: true
end

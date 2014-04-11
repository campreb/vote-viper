class Election < ActiveRecord::Base
  validates :name, presence: true
end

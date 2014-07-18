class Campaign < ActiveRecord::Base
  has_many :questions
  has_many :responders
  validates :title, presence: true

  accepts_nested_attributes_for :questions, allow_destroy: true

  def opens_at=(time_str)
    super Chronic.parse(time_str)
  end

  def closes_at=(time_str)
    super Chronic.parse(time_str)
  end
end

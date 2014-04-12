class Responder < ActiveRecord::Base
  belongs_to :election
  has_many :votes

  validates :email, :name, presence: true
  accepts_nested_attributes_for :votes

  before_create :populate_key

  private

  def populate_key
    self.private_key = SecureRandom.uuid
  end
end

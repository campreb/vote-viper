class Responder < ActiveRecord::Base
  belongs_to :campaign
  has_many :responses

  validates :email, :name, presence: true
  validates_uniqueness_of :email, scope: :campaign_id
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
  accepts_nested_attributes_for :responses

  before_create :populate_key

  private

  def populate_key
    self.private_key = SecureRandom.uuid
  end
end

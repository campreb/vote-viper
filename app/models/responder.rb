require 'csv'

class Responder < ActiveRecord::Base
  class ImportError < Exception; end

  belongs_to :campaign
  has_many :responses

  validates :email, :name, presence: true
  validates_uniqueness_of :email, scope: :campaign_id
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
  accepts_nested_attributes_for :responses

  before_create :populate_key

  def self.import!(campaign, import_csv_file)
    transaction do
      CSV.foreach(import_csv_file.try(:path), headers: true) do |row|
        campaign.responders.create!(email: row[1], name: row[0])
      end
    end
  rescue Exception => e
    # Remap to an import error
    raise ImportError.new(e.message)
  end

  private

  def populate_key
    self.private_key = SecureRandom.uuid
  end
end

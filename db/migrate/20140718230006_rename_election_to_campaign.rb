class RenameElectionToCampaign < ActiveRecord::Migration
  def change
    rename_table :elections, :campaigns
  end
end

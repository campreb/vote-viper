class RenameElectionAssociationOnResponders < ActiveRecord::Migration
  def change
    remove_column :responders, :election_id
    add_column :responders, :campaign_id, :integer, index: true
  end
end

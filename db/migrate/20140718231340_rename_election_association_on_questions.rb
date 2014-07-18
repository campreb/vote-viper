class RenameElectionAssociationOnQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :election_id
    add_column :questions, :campaign_id, :integer, index: true
  end
end

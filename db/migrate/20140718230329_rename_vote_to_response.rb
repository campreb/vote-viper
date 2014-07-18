class RenameVoteToResponse < ActiveRecord::Migration
  def change
    rename_table :votes, :responses
  end
end

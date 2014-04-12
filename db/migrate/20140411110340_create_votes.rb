class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :responder, index: true
      t.belongs_to :question, index: true
      t.belongs_to :option, index: true

      t.timestamps
    end
  end
end

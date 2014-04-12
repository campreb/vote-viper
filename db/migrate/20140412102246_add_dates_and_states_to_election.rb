class AddDatesAndStatesToElection < ActiveRecord::Migration
  def change
    change_table :elections do |t|
      t.datetime :opens_at
      t.datetime :closes_at
      t.string :state
    end
  end
end

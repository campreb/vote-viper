class CreateResponders < ActiveRecord::Migration
  def change
    create_table :responders do |t|
      t.string :name
      t.string :email
      t.string :private_key
      t.string :state
      t.belongs_to :election, index: true

      t.timestamps
    end
  end
end

class CreateElections < ActiveRecord::Migration
  def change
    create_table :elections do |t|
      t.string :title
      t.text :description
      t.integer :region_id

      t.timestamps
    end
  end
end

class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :description
      t.integer :sort_order
      t.belongs_to :election, index: true

      t.timestamps
    end
  end
end

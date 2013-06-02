class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :text
      t.integer :pathway_id
      t.integer :order
      t.timestamps
    end
  end
end

class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.text :text
      t.integer :question_id
      t.integer :resource_id
      t.integer :pathway_id

      t.timestamps
    end
  end
end

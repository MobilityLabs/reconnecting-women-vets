class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :text
      t.integer :question_id
      t.integer :resource_id
      t.integer :pathway_id

      t.timestamps
    end
  end
end

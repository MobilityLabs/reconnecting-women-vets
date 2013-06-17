class CreateAnswersPathways < ActiveRecord::Migration
  def change
    create_table :answers_pathways do |t|
      t.integer :answer_id
      t.integer :pathway_id

      t.timestamps
    end
  end
end

class CreateAnswersResources < ActiveRecord::Migration
  def change
    create_table :answers_resources do |t|
      t.integer :answer_id
      t.integer :resource_id

      t.timestamps
    end
  end
end

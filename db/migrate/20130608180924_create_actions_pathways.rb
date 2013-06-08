class CreateActionsPathways < ActiveRecord::Migration
  def change
    create_table :actions_pathways do |t|
      t.integer :action_id
      t.integer :pathway_id

      t.timestamps
    end
  end
end

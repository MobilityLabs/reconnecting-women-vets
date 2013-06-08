class CreateActionsResources < ActiveRecord::Migration
  def change
    create_table :actions_resources do |t|
      t.integer :action_id
      t.integer :resource_id

      t.timestamps
    end
  end
end

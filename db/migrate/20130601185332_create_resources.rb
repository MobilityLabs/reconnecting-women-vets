class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name
      t.string :link
      t.integer :starting_weight

      t.references :category

      t.timestamps
    end
  end
end

class AddEndOfPathToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :end_of_path, :boolean, null: false, default: false
  end
end

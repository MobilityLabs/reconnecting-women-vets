class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :goto_pathway, foreign_key: :pathway_id, class_name: 'Pathway'
  has_and_belongs_to_many :resources
end

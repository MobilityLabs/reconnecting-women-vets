class Action < ActiveRecord::Base
  belongs_to :question
  belongs_to :goto_pathway, foreign_key: :pathway_id, class_name: 'Pathway'
  # belongs_to :connected_resource, foreign_key: :resource_id, class_name: 'Resource'
  has_and_belongs_to_many :resource
end

class Action < ActiveRecord::Base
  belongs_to :question
  has_one :goto_pathway, foreign_key: :pathway_id
  has_one :connected_resource, foreign_key: :resource_id
end

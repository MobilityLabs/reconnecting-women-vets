class Question < ActiveRecord::Base
  belongs_to :pathway
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers, reject_if: lambda {|a| a[:text].blank?}, allow_destroy: true

end

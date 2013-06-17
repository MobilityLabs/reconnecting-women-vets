class Pathway < ActiveRecord::Base

  has_many :questions, order: :order, dependent: :destroy
  has_and_belongs_to_many :action

  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:text].blank? }, :allow_destroy => true

  after_update :save_questions

  private

  validates_associated :questions

end

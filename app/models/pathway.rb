class Pathway < ActiveRecord::Base

  has_many :questions, -> { order :order }, dependent: :destroy

  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:text].blank? }, :allow_destroy => true

  def questions_order
    questions.map {|q| q.id.to_s }
             .join ','
  end

  def questions_order=(order_list)
    order_list.split(',').each_with_index do |id, ix|
      n = questions.find_index {|q| q.id == id.to_i}
      questions[n].order = ix+1 unless n.nil?
    end
  end

private

  validates_associated :questions

end

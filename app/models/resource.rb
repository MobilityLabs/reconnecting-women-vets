class Resource < ActiveRecord::Base
  belongs_to :category
  has_and_belongs_to_many :answers

  def self.find_for(answers)

    applicable = Hash.new 0
    #   key   = resource id
    #   value = applicable count

    answers.each do |id|
      begin
        Answer.includes(:resources).find(id).resources.each do |resource|
          applicable[resource.id] += resource.starting_weight
        end
      rescue ActiveRecord::RecordNotFound
        Rails.logger.info "Ignoring missing answer for id# #{id}"
      end
    end

    # return applicable resources, sorted in descending order by frequency*starting_weight
    applicable.to_a.sort { |a,b| b[1] <=> a[1] } .map { |a| Resource.find(a[0]) }

  end

end

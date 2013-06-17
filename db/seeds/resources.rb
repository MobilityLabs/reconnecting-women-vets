def import_resources
  CSV.foreach('./db/resources.csv', headers: true, col_sep: ',') do |row|
    resource = Resource.new()
    r_hash = row.to_hash
    resource.name = r_hash['Resource']
    resource.category = Category.find_by_name( r_hash['Category'].to_s )
    resource.link = r_hash['Url']
    resource.starting_weight = r_hash['Weight']

    resource.save!
  end
end
import_resources
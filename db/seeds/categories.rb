['Childcare','Transportation','Mentoring','Education and Training', 'Licensing/Contracting', 'Employment'].each do |c|
  if Category.find_by_name( c ).blank?
    Category.create!(name: c)
  end
end
[{email:'sean@mobility-labs.com', password:'PaSsWoRd', confirm: true},
 {email:'marlon.nelson@gmail.com', password:'test1234', confirm: true},
 {email:'testadmin@localhost.com', password:'test1234', confirm: true},
 {email:'test@localhost.com', password:'test1234', confirm: false}].each do |seed|
  admin = Admin.find_or_initialize_by(email: seed[:email])
  if admin.new_record?
    admin.password_confirmation = admin.password = seed[:password]
    admin.save!
    admin.confirm! if seed[:confirm]
  end
end
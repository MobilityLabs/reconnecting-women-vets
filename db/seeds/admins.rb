[{email:'sean@mobility-labs.com', password:'PaSsWoRd'},
 {email:'marlon.nelson@gmail.com', password:'test1234'},
 {email:'test@localhost.com', password:'test1234'}].each do |seed|
  admin = Admin.find_or_initialize_by(email: seed[:email])
  if admin.new_record?
    admin.password_confirmation = admin.password = seed[:password]
    admin.save!
  end
end
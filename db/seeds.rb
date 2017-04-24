user = User.create(email: "vc.raghav@gmail.com", password: "password", password_confirmation: "password")
user.save!
puts "Created user"
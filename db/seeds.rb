User.create!(
  email: "test@test.com",
  name: "Homer",
  password: "asdfasdf",
  password_confirmation: "asdfasdf",
  roles: "user",
)

puts "1 User created"

User.create!(
  email: "admin@test.com",
  name: "Admin",
  password: "asdfasdf",
  password_confirmation: "asdfasdf",
  roles: "admin",
)

puts "1 Admin User created"
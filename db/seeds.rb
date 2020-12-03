# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create a main user.
User.create!(first_name: "test",
  last_name: "user",
  email: "test@test.org",
  password: "password",
  password_confirmation: "password")

  # Generate random users.
  99.times do |n|
  f_name = Faker::Name.name
  l_name = Faker::Name.name
  email = "test-#{n+1}@test.org"
  password = "password"
  User.create!(first_name: f_name,
  last_name: l_name,
  email: email,
  password: password,
  password_confirmation: password)
  end

# Generate posts for a subset of users.
users = User.order(:created_at).take(6)
50.times do
content = Faker::Lorem.sentence(word_count: 5)
users.each { |user| user.posts.create!(content:
content) }
end
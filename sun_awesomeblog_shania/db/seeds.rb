# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create the main sample user.
User.create!(name: "Sun-Asterisk",
	email: "framgia@email.com",
	password: "password",
	password_confirmation: "password",
	admin: true)

# Create a 2nd main sample user.
User.create!(name: "Michael Reeves",
	email: "michael@email.com",
	password: "password",
	password_confirmation: "password",
	admin: true)

# Generate a bunch of additional users.
99.times do |n|
	name = Faker::Games::Pokemon.name
	email = "user-#{n+1}@email.com"
	password = "password"
	User.create!(name: name,
		email: email,
		password: password,
		password_confirmation: password)
end

# Generate microposts for a subset of users.
users = User.order(:created_at).take(7)
99.times do
	content = Faker::Lorem.sentence(word_count: 7)
	users.each { |user| user.microposts.create!(content: content) }
end

# Create following relationships.
users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
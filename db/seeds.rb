# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# 5.times do |i|
# 	user = User.create(email: "test#{i}@email.com", password: "password")
# 	3.times do |j|
# 		movie = user.movies.create!(title: "Movie ##{j}", description: "This is a movie", category: "Action")
# 		user.likes.create!(movie: movie)
# 		5.times do |k|
# 			movie.reviews.create!(comment: "Comment ##{k}", rating: 5)
# 		end
# 	end
# end
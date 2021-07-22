# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "destroying old data"
Review.destroy_all
Book.destroy_all
User.destroy_all
puts "data successfully destroyed"
puts "Seeding started"

user = User.create(username: "alice",
                   email: "a@gmail.com",
                   password: "qwerty",
                   password_confirmation: "qwerty")

book = user.books.create(
  author: "J.K. Rowling",
  title: "Harry Potter and the Chamber of Secrets",
  year: 1998,
  genre: "Fantasy",
  status: "read",

)

book.create_review(
  description: "this is our first description",
  rating: 3,
)

book = user.books.create(
  author: "Harper Lee",
  title: "How to Kill a mockingbird",
  year: 1960,
  genre: "Fiction",
  status: "unread",
)

book.create_review(
  description: "this is our 2nd description",
  rating: 5,
)

book = user.books.create(
  author: "J. R. R. Tolkien",
  title: "The Hobbit",
  year: 1937,
  genre: "Fiction",
  status: "unread",

)

book.create_review(
  description: "this is our 3nd description",
  rating: 2,

)

book = user.books.create(
  author: "C. S. Lewis",
  title: "The Lion, the Witch and the Wardrobe",
  year: 1950,
  genre: "Fiction",
  status: "unread",

)

book.create_review(
  description: "this is our 4nd description",
  rating: 4,

)

book = user.books.create(
  author: "J.K. Rowling",
  title: "Harry Potter and the Philosophers Stone",
  year: 1997,
  genre: "Fantasy",
  status: "read",

)

book.create_review(
  description: "this is our 5nd description",
  rating: 1,

)

book = user.books.create(
  author: "J.K. Rowling",
  title: "Harry Potter and the Prisoner of Azkaban",
  year: 1999,
  genre: "Fantasy",
  status: "read",

)

book.create_review(
  description: "this is our 6nd description",
  rating: 3,

)
# # _______________________________________________

# # USER 2
# # _______________________________________________

user = User.create(username: "mark",
                   email: "m@gmail.com",
                   password: "qwerti",
                   password_confirmation: "qwerti")

book = user.books.create(
  author: "J.K. Rowling",
  title: "Harry Potter and the Chamber of Secrets",
  year: 1998,
  genre: "Fantasy",
  status: "read",

)

book.create_review(
  description: "this is our 8th description",
  rating: 2,

)

book = user.books.create(
  author: "Harper Lee",
  title: "How to Kill a mockingbird",
  year: 1960,
  genre: "Fiction",
  status: "unread",

)

book.create_review(
  description: "this is our 9th description",
  rating: 4,

)

book = user.books.create(
  author: "J. R. R. Tolkien",
  title: "The Hobbit",
  year: 1937,
  genre: "Fiction",
  status: "unread",

)

book.create_review(
  description: "this is our 10th description",
  rating: 1,

)

book = user.books.create(
  author: "C. S. Lewis",
  title: "The Lion, the Witch and the Wardrobe",
  year: 1950,
  genre: "Fiction",
  status: "unread",

)

book.create_review(
  description: "this is our 11th description",
  rating: 5,

)

book = user.books.create(
  author: "J.K. Rowling",
  title: "Harry Potter and the Philosophers Stone",
  year: 1997,
  genre: "Fantasy",
  status: "read",

)

book.create_review(
  description: "this is our 12th description",
  rating: 3,

)

book = user.books.create(
  author: "J.K. Rowling",
  title: "Harry Potter and the Prisoner of Azkaban",
  year: 1999,
  genre: "Fantasy",
  status: "read",

)

book.create_review(
  description: "this is our 13th description",
  rating: 4,
)
puts "Seed End"

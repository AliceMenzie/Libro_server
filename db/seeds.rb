# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seed Starting"

book = Book.create(
  author: "J.K. Rowling",
  title: "Harry Potter and the Chamber of Secrets",
  year: 1998,
  genre: "Fantasy",
  status: "unread",
)

book = Book.create(
  author: "Harper Lee",
  title: "How to Kill a mockingbird",
  year: 1960,
  genre: "Fiction",
  status: "unread",
)

book = Book.create(
  author: "J. R. R. Tolkien",
  title: "The Hobbit",
  year: 1937,
  genre: "Fiction",
  status: "unread",
)

book = Book.create(
  author: "C. S. Lewis",
  title: "The Lion, the Witch and the Wardrobe",
  year: 1950,
  genre: "Fiction",
  status: "unread",
)

book = Book.create(
  author: "J.K. Rowling",
  title: "Harry Potter and the Philosophers Stone",
  year: 1997,
  genre: "Fantasy",
  status: "unread",
)

book = Book.create(
  author: "J.K. Rowling",
  title: "Harry Potter and the Prisoner of Azkaban",
  year: 1999,
  genre: "Fantasy",
  status: "unread",
)

puts "Seed End"

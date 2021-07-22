FactoryBot.define do
  factory :book do
    author { "J.K. Rowling" }
    title { "Harry Potter and the Chamber of Secrets" }
    year { 1998 }
    genre { "Fantasy" }
    status { "read" }
    user_id { 1 }
  end
  trait :invalidyear do year { "yearisnotastring" } end
end

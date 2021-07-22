FactoryBot.define do
  factory :review do
    description { "I love this book" }
    rating { 4 }
    book_id { 1 }
  end
  trait :invalidreview do rating { "notanumber" } end
end

FactoryBot.define do
  factory :user do
    email { "test@test.com" }
    username { "testuser" }
    password { "qwerty" }
  end
  trait :invalid do username { "notmyusername" } end
end

# FactoryBot.define do
#   factory :invalid do
#     email { "test@test.com" }
#     username { " " }
#     password { "qwerty" }
#   end
# end

# FactoryBot.define do
#   factory :sign do
#     email { "test@test.com" }
#     username { "testuser" }
#     password { "qwerty" }
#     password_confirmation { "qwerty" }
#   end
# end

FactoryBot.define do
    factory :user do
      name { "John Doe" }
      email { "john@example.com" }
      password { "password" }
      is_admin { false }
      avatar { "avatar.png" }
    end
  end
  
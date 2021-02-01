FactoryBot.define do
  factory :chess_board do
  end
end

FactoryBot.define do
  factory :piece do
  end
end

FactoryBot.define do
  factory :square do
  end
end

FactoryBot.define do
  factory :player do
    user_name "myUserName"
    email "user@email.com"
    password "password"
  end
end

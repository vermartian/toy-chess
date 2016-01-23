FactoryGirl.define do
  factory :chess_board do
  end
end

FactoryGirl.define do
  factory :piece do
  end
end

FactoryGirl.define do
  factory :square do
  end
end

FactoryGirl.define do
  factory :player do
    user_name "myUserName"
    email "user@email.com"
    password "password"
  end
end

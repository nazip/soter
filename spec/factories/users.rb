FactoryGirl.define do
  sequence :email do |n|
    "test#{n}@mail.ru"
  end

  factory :user do
    email
    password 'some_password'
    password_confirmation 'some_password'
    confirmed_at DateTime.now()
  end

end

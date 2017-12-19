FactoryGirl.define do
  factory :user do
    nickname "Aroney"
    first_name "Jackyii"
    last_name "Smith"
    email "test@test.com"
    phone "9495067893"
    gender "Male"
    password "23456893rdg"
    password_confirmation "23456893rdg"
    status true
  end
end

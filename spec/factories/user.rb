FactoryGirl.define do
  factory :default_user, class: User do
    name      "John Doe"
    username  "JDoe"
    email     "johndoe@example.com"
    password  "password"
    role      0
  end

  factory :admin_user, class: User do
    name      "Jane Doe"
    username  "JaneDoe"
    email     "janedoe@example.com"
    password  "password"
    role      1
  end
end

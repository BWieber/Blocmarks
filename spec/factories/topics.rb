FactoryGirl.define do

  factory :topic do
    title Faker::Internet.name

    user
  end

end

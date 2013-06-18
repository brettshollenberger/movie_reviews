# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :viewed_movie do
    user_id 1
    sequence(:movie_id) { |n| n }
  end
end

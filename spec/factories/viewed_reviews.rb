FactoryGirl.define do
  factory :viewed_reviews do
    user
    sequence(:review_id) { |n| n }
  end
end

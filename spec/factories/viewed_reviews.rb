FactoryGirl.define do
  factory :viewed_review do
    user
    sequence(:review_id) { |n| n }
  end
end

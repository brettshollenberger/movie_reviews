FactoryGirl.define do
  factory :movie do
    sequence(:title) { |n| "Good Burger Hunting #{n}" }
    sequence(:description) { |n| "Starring Misters Keenan, Kel, Matt Damon, and Benjamin Howard Afleck #{n}." }
  end

  factory :user do
    sequence(:email) { |n| "sicknazty#{n}@gmail.com" }
    password "12345678"
    password_confirmation "12345678"
    trait :normal_user do
      admin false
    end

    trait :admin_user do
      admin true
    end

    trait :suspended_status do
      status "suspended"
    end

    factory :suspended_user, traits: [:suspended_status]
    factory :admin, traits: [:admin_user]
    factory :general_user, traits: [:normal_user]
  end

  factory :review do
    content "Good Burger Hunting is the best
    moobie I evar sawn today."
    score "2"
    user
    movie
    trait :flagged_review do
      status "flagged"
    end

    trait :suspended_review do
      status "suspended"
    end

    factory :flagged, traits: [:flagged_review]
    factory :suspended, traits: [:suspended_review]
  end

  factory :like do
    user

    trait :likable_review do
      association :likable, factory: :review
    end

    trait :likable_movie do
      association :likable, factory: :movie
    end

    trait :disliked do
      polarity -1
    end

    trait :liked do
      polarity 1
    end

    factory :like_for_reviews, traits: [:likable_review, :liked]
    factory :like_for_movies, traits: [:likable_movie, :liked]
    factory :dislike_for_reviews, traits: [:likable_review, :disliked]
    factory :dislike_for_movies, traits: [:likable_movie, :liked]
  end

end

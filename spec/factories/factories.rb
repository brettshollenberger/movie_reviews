FactoryGirl.define do
  factory :movie do
    title "Good Burger Hunting"
    description "Starring Misters Keenan,
    Kel, Matt Damon, and Benjamin Howard Afleck."
  end

  factory :user do
    sequence(:email) { |n| "sicknazty#{n}@gmail.com" }
    password "12345678"
    password_confirmation "12345678"
    admin false
    factory :admin do
      admin true
    end
  end

  factory :review do
    content "Good Burger Hunting is the best
    moobie I evar sawn today."
    score "2"
    user
    movie
  end

end

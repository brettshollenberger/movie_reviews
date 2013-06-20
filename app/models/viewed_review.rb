class ViewedReview < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validate :uniq_review_viewed, on: :create

  attr_accessible :review, :user

  def uniq_review_viewed
   errors.add(:review, "repeated") if user.last_three_reviews_viewed.pluck(:review_id).include? review_id
  end

end

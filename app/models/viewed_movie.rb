class ViewedMovie < ActiveRecord::Base

  belongs_to :user
  belongs_to :movie

  validate :uniq_movie_viewed, on: :create

  attr_accessible :movie, :user

  def uniq_movie_viewed
   errors.add(:movie, "repeated") if user.last_three_movies_viewed.pluck(:movie_id).include? movie_id
  end

end

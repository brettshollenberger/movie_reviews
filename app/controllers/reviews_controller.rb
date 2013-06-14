class ReviewsController < ApplicationController
  def index
  end

  def create
    if current_user
      @movie = Movie.find(params[:movie_id])
      @review = @movie.reviews.build(params[:review])
      @review.user = current_user

      if @review.save
        redirect_to @movie, notice: "Review created"
      else
        redirect_to @movie, notice: "There was an error creating your review"
      end
    else
      redirect_to new_user_session_path, notice: "You must sign in to write reviews"
    end
  end
end

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

  def destroy
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:id])

    if @review.delete
      flash[:notice] = "Review deleted"
      redirect_to @movie
    else
      flash[:error] = "There was an error deleting your review"
      redirect_to @movie
    end
  end

  def edit
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:id])

    if @review.update_attributes(params[:review])
      flash[:notice] = "Review updated"
      redirect_to @movie
    else
      flash[:error] = "There was an error updating your review"
      redirect_to @movie
    end
  end

  def flag
    @review = Review.find(params[:format])
    @movie = @review.movie

    if @review.update_attributes(status: "flagged")
      flash[:notice] = "Review flagged"
      redirect_to @movie
    else
      flash[:notice] = "There was an error flagging this review"
      redirect_to @movie
    end
  end
end

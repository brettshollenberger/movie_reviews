class MoviesController < ApplicationController
  before_filter :suspended_account?

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @review = @movie.reviews.new
    @reviews = @movie.reviews.order("created_at DESC")
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(params[:movie])
    flash[:notice] = "You have successfully added a new movie"
    redirect_to  movie_path(@movie)
  end

  def suspended_account?
    if current_user
      if current_user.status == "suspended"
        sign_out(current_user)
        redirect_to root_path, notice: "Your account has been suspended"
      end
    end
  end

end

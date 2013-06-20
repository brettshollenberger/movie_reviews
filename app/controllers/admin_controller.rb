class AdminController < ApplicationController
  def index
    @movies = Movie.all
    @users = User.all
  end

  def edit_user
    @user = User.find(params[:format])
  end

  def remove_review
    @review = Review.find(params[:format])
    @user = @review.user

    if @review.delete
      flash[:notice] = "Review deleted"
      redirect_to admin_edit_user_path(@user)
    else
      flash[:error] = "There was an error deleting the review"
      redirect_to admin_edit_user_path(@user)
    end
  end
end

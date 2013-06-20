class AdminController < ApplicationController
  before_filter :validate_admin
  before_filter :suspended_account?

  def index
    @movies = Movie.all
    @users = User.all
  end

  def edit_user
    @user = User.find(params[:format])
  end

  def suspend_review
    @review = Review.find(params[:format])
    @user = @review.user

    if @review.update_attributes(status: "suspended")
      flash[:notice] = "Review suspended"
      redirect_to admin_edit_user_path(@user)
    else
      flash[:error] = "There was an error suspending the review"
      redirect_to admin_edit_user_path(@user)
    end
  end

  def unsuspend_review
    @review = Review.find(params[:format])
    @user = @review.user

    if @review.update_attributes(status: "ok")
      flash[:notice] = "Suspension lifted"
      redirect_to admin_edit_user_path(@user)
    else
      flash[:error] = "There was an error lifting the suspension"
      redirect_to admin_edit_user_path(@user)
    end
  end

  def suspend_user
    @user = User.find(params[:format])

    if @user.update_attributes(status: "suspended")
      flash[:notice] = "Account suspended"
      redirect_to admin_edit_user_path(@user)
    else
      flash[:notice] = "There was an error suspending this account"
      redirect_to admin_edit_user_path(@user)
    end
  end

  def validate_admin
    redirect_to root_path unless current_user.admin?
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

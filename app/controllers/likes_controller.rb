class LikesController < ApplicationController
  def new
    create
  end

  def index
  end

  def create
    @likable = find_likable
    @user = current_user
    @like = @user.likes.build(likable: @likable)
    @like.save
    redirect_to @likable
  end

  def destroy
    @likable = find_likable
    @user = current_user
    @like = Like.where(user_id: current_user.id, likable_id: @likable.id).first

    @like.delete
    redirect_to @likable
  end

  private

  def find_likable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end

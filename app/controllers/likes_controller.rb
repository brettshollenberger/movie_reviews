class LikesController < ApplicationController
  def new
    create
  end

  def create
    @likable_parent, @likable_child = find_likable
    @user = current_user

    if @likable_child == nil
      @like = @user.likes.build(likable: @likable_parent, polarity: params[:polarity])
    else
      @like = @user.likes.build(likable: @likable_child, polarity: params[:polarity])
    end
    @like.save
    redirect_to @likable_parent
  end

  def destroy
    @likable_parent, @likable_child = find_likable
    @user = current_user

    if @likable_child == nil
      @like = Like.where(user_id: current_user.id, likable_id: @likable_parent.id).first
    else
      @like = Like.where(user_id: current_user.id, likable_id: @likable_child.id).first
    end

    @like.delete
    redirect_to @likable_parent
  end

  private

  def find_likable
    likable = []
    params.each do |name, value|
      if name =~ /(.+)_id$/
        likable.push($1.classify.constantize.find(value))
      end
    end
    return likable[0], likable[1] if likable.length > 1
    return likable[0], nil if likable.length == 1
    nil
  end
end

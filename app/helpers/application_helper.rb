module ApplicationHelper

  def user_likes?(thing)
    begin
      @like = Like.where(user_id: current_user.id, likable_id: thing.id).first
      return true if @like.polarity == 1
    rescue
      return false
    end
  end

  def user_dislikes?(thing)
    begin
      @like = Like.where(user_id: current_user.id, likable_id: thing.id).first
      return true if @like.polarity == -1
    rescue
      return false
    end
  end

  def likeify(polarity)
    return "dislike" if polarity.abs != polarity # Polarity is negative
    return "like"
  end

end

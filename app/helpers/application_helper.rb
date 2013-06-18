module ApplicationHelper
  def user_likes?(thing)
    begin
      @like = Like.where(user_id: current_user.id, likable_id: thing.id).first
      return true if @like != nil
    rescue
      return false
    end
  end
end

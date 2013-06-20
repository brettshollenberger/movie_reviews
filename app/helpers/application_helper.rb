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

  def likeify(collection)
    polarity = polarify(collection)
    return "dislike" if polarity.abs != polarity # Polarity is negative
    return "like"
  end

  def polarify(collection)
    returner = 0
    collection.likes.each { |like| returner += like.polarity }
    return returner
  end

  def avatar_url(user)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?"
  end

  def admin?
    current_user.admin?
  end

  def flagged_reviews(user)
    flagged = []
    user.reviews.each do |review|
      flagged.push(review) if review.status == "flagged"
    end
    return flagged if !flagged.empty?
    return false
  end

end

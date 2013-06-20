class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :admin
  # attr_accessible :title, :body

  has_many :reviews, {
    :dependent => :destroy,
    :inverse_of => :user
  }

  has_many :likes, {
    :dependent => :destroy,
    :inverse_of => :user
  }

  has_many :viewed_movies, { dependent: :destroy }

  has_many :movies, {through: :viewed_movies}


  def last_three_movies_viewed
    viewed_movies.order("created_at DESC").limit(3)
  end

end

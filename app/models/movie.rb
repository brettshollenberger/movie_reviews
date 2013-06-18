class Movie < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :title, uniqueness: true
  validates :description, uniqueness: true

  attr_accessible :description, :title

  has_many :reviews, {
    dependent: :destroy,
    inverse_of: :movie
  }
  has_many :viewed_movies, { dependent: :destroy }
  
  has_many :users,{through: :viewed_movies}

end

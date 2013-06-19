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
  has_many :likes, :as => :likable, dependent: :destroy  
end

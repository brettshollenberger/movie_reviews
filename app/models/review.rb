class Review < ActiveRecord::Base
  attr_accessible :content, :score, :movie_id,
  :user_id

  validates :content, :movie, :user, :score, {
    presence: true
  }

  validates :movie_id, :user_id, :score, {
    numericality: true
  }

  validates_inclusion_of :score, {
    in: 1..5
  }

  belongs_to :movie, {
    inverse_of: :reviews
  }

  belongs_to :user, {
    inverse_of: :reviews
  }

  has_many :likes, :as => :likable, dependent: :destroy
end

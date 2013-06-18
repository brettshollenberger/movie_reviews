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

  def self.recent_three
    Movie.find(:all, :order => "created_at DESC", :limit=>3)
  end
end

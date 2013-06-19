class Movie < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :title, uniqueness: true
  validates :description, uniqueness: true

  attr_accessible :description, :title, :image

  mount_uploader :image, ImageUploader

  has_many :reviews, {
    dependent: :destroy,
    inverse_of: :movie
  }
  has_many :likes, :as => :likable, dependent: :destroy  
end

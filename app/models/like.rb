class Like < ActiveRecord::Base
  attr_accessible :user, :likable, :polarity, :likable_type, :likable_id

  validates :user, :likable, :polarity,  {
    presence: true
  }

  validates :polarity, {
    numericality: true,
    inclusion: { :in => -1..1 },
  }

  belongs_to :likable, :polymorphic => true

  belongs_to :user

  validates_uniqueness_of :user_id, :scope => [:likable_id, :likable_type]

end

class Like < ActiveRecord::Base
  attr_accessible :likable_id, :likable_type, :user, :user_id, :likable

  validates :likable_type, :likable_id, :user, :likable,  {
    presence: true
  }

  belongs_to :likable, :polymorphic => true

  belongs_to :user

  validates_uniqueness_of :user_id, :scope => [:likable_id, :likable_type]

end

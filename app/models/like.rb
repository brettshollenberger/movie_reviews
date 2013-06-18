class Like < ActiveRecord::Base
  attr_accessible :likable_id, :likable_type

validates :likable_type, :likable_id,  {
    presence: true
  }

  belongs_to :likable, :polymorphic => true

end

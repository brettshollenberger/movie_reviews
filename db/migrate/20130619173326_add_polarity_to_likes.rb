class AddPolarityToLikes < ActiveRecord::Migration
  def change
    add_column :likes, :polarity, :integer, null: false, default: 1
  end
end

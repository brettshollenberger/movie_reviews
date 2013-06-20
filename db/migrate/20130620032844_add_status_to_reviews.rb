class AddStatusToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :status, :string, null: false, default: "ok"
  end
end

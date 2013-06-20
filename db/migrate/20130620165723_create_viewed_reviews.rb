class CreateViewedReviews < ActiveRecord::Migration
  def change
    create_table :viewed_reviews do |t|
      t.integer :user_id
      t.integer :review_id
      t.timestamps
    end
  end
end

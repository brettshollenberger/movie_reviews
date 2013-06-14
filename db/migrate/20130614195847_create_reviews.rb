class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :content, null: false
      t.integer :score, null: false
      t.integer :user_id, null: false
      t.integer :movie_id, null: false

      t.timestamps
    end
  end
end

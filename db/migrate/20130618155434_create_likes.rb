class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :likable_id, null: false 
      t.string :likable_type, null: false

      t.timestamps
    end
  end
end

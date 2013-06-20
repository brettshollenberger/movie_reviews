class AddStatusToUsers < ActiveRecord::Migration
  def change
    add_column :users, :status, :string, null: false, default: "ok"
  end
end

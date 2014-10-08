class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
  	add_index :vendor_users, :email, unique: true
  end
end

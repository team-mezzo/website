class AddPasswordDigestToVendorUsers < ActiveRecord::Migration
  def change
    add_column :vendor_users, :password_digest, :string
  end
end

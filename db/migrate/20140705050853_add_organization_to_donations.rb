class AddOrganizationToDonations < ActiveRecord::Migration
  def change
  	add_column :donations, :organization, :string
  	add_column :donations, :pickup_time_start, :datetime
  	add_column :donations, :pickup_time_end, :datetime
  	add_column :donations, :raw_amount, :integer, default: nil
  	add_column :donations, :prepared_amount, :integer, default: nil

  	change_column :donations, :description, :text
  end
end

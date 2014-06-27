class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.string :description

      t.timestamps
    end
  end
end

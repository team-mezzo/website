class Donation < ActiveRecord::Base
	validates :description, presence: true
end

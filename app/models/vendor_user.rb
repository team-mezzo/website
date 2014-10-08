class VendorUser < ActiveRecord::Base
	validates :first_name, presence: true, length: { maximum: 50 }
	validates :last_name, presence: true, length: { maximum: 50 }
	validates :password, length: { minimum: 6 }
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
									  uniqueness: { case_sensitive: false }

	# save lowercase version of email so database can enforce unique indexes
	before_save { self.email = email.downcase } 

	has_secure_password # includes presence and confirmation validation for password
end

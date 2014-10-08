require 'rails_helper'

RSpec.describe VendorUser, :type => :model do
 	
	before { @user = VendorUser.new(first_name: "Claire", last_name: "Huang", email: "16chuang@castilleja.org") }

	subject { @user }

	it { should respond_to(:first_name) }
	it { should respond_to(:last_name) }
	it { should respond_to(:email) }
end

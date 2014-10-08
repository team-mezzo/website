class VendorUsersController < ApplicationController
	def new
		
	end

	def show
		@user = VendorUser.find(params[:id])
	end
end

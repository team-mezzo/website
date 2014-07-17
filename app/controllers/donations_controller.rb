class DonationsController < ApplicationController
	def index
		# new donation for the submission form
		@donation = Donation.new 
		@donations = Donation.all
	end

	def new
		@donation = Donation.new
	end

	def create
		# render :text => params.inspect

		Donation.create(permitted_params(params))
		redirect_to donations_path
	end

	def edit
		@donation = Donation.find(params[:id])
	end

	def update
		@donation = Donation.find(params[:id])

		# if update successful
		if (@donation.update_attributes(permitted_params(params)))
			redirect_to donations_path, :notice => 'Your donation has successfully been updated.'
		else
			redirect_to :back, :notice => 'There was an error updating your donation.'
		end
	end

	def destroy
		Donation.destroy params[:id]
		redirect_to :back, :notice => "Donation has been deleted."
	end

	private 
		def permitted_params(params)
			params.require(:donation).permit(:description, :organization, :pickup_start_time, :pickup_end_time)
		end
end

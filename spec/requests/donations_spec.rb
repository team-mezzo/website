require 'spec_helper'

RSpec.describe "Donations", :type => :request do
  describe "GET /donations" do
    before do
        @donation = Donation.create :description => 'food'
    end

    it "displays some donations" do
    	visit donations_path
    	page.should have_content 'food'
    end

    it "creates a new donation" do
    	visit donations_path
    	fill_in 'Donation', :with => 'more food'
    	click_button 'Create Donation'

    	current_path.should == donations_path
    	page.should have_content 'more food'

    	save_and_open_page
    end
  end

  describe "PUT /donations" do
    it "should edit a donation" do
        visit donations_path
        click_link 'Edit'

        current_path.should == edit_donation_path(@donation)

        # page.should have_content 'food'
        find_field('Description').value.should == 'food'

        fill_in 'Donation', :with => 'updated food'
        click_button 'Update Donation'

        current_path.should == donations_path
        page.should have_content 'updated food'
    end

    it "should not update an empty donation" do
        visit donations_path
        click_link 'Edit'

        fill_in 'Description', :with => ''
        click_button 'Update Donation'

        current_path.should == edit_donation_path(@donation)
        page.should have_content 'There was an error updating your donation.'
    end
  end

  describe "DELETE /tasks" do
      it "should delete a donation" do
          visit donations_path
          find('#donation_#{@donation.id}').click_link 'Delete'
          page.should have_content 'Donation has been deleted.'
          page.should have_no_content 'food'
      end
  end
end

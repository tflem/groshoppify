require "rails_helper"

RSpec.describe "Our admins can create new users" do
	let(:admin) { FactoryBot.create(:user, :admin) }

	before do
		login_as(admin)
		visit "/"
		click_link "Admin"
		click_link "Users"
		click_link "Add New User"
	end

	it "with valid credentials" do
		fill_in "Email", with: "newuser@example.com"
		fill_in "Password", with: "userpassword"
		click_button "Create User"
		expect(page).to have_content "A new user has been created."		
	end  
end
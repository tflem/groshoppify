require "rails_helper"

RSpec.feature "Our users can create new products" do
	scenario "with valid attributes" do
		visit "/"

		click_link "New Product"

		fill_in "Name", with: "Milk"
		fill_in "Description", with: "Pickup two percent, not skim." 
		fill_in "Quantity", with: 2
		click_button "Create Product"

		expect(page).to have_content "Product information has been created."
  end
end
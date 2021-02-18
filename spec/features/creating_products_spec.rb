require "rails_helper"

RSpec.feature "Our users can create new products" do
	before do
		visit "/"

		click_link "New Product"
	end

	scenario "with valid attributes" do
		fill_in "Name", with: "Milk"
		fill_in "Description", with: "Pickup two percent, not skim." 
		fill_in "Quantity", with: 2
		click_button "Create Product"

		expect(page).to have_content "Product information has been created."

		product = Product.find_by(name: "Milk")
		expect(page.current_url).to eq product_url(product)

		title = "Milk - Products - Groshoppify"
		expect(page).to have_title title
  end
  
  scenario "with invalid attributes" do
  	click_button "Create Product"

  	expect(page).to have_content "Product information has not been created."
  	expect(page).to have_content "Name can't be blank"
  	expect(page).to have_content "Quantity can't be blank"
  end
end
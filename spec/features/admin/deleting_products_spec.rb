# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Our users can delete products" do
  before do
    login_as(FactoryBot.create(:user, :admin))
  end
  
  it "successfully" do
    FactoryBot.create(:product, name: "Milk")

    visit "/"
    click_link "View Products"
    click_link "Milk"
    click_link "Delete Product"

    expect(page).to have_content "Product has been deleted."
    expect(page.current_url).to eq products_url
    expect(page).to have_no_content "Milk"
  end
end

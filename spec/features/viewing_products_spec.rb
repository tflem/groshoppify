# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Our users can view products" do
  it "with the product details" do
    product = FactoryBot.create(:product, name: "Milk")

    visit "/"
    click_link "View Products"
    click_link "Milk"
    expect(page.current_url).to eq product_url(product)
  end
end

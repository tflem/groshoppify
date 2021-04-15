require "rails_helper"

RSpec.describe "Our users can only see appropriate links" do
  let(:product) { FactoryBot.create(:product) }
  let(:user) { FactoryBot.create(:user) }
  let(:admin) { FactoryBot.create(:user, :admin) }

  context "lurkers" do
    it "cannot see the New Product link" do
      visit "/"
      expect(page).not_to have_link "New Product"
    end

    it "cannot see the Delete Product link" do
      visit product_path(product)
      expect(page).not_to have_link "Delete Product"      
    end
  end

  context "general users" do
    before { login_as(user) }

    it "cannot see the New Product link" do
      visit "/"
      expect(page).not_to have_link "New Product"
    end

    it "cannot see tge Delete Product link" do
      visit product_path(product)
      expect(page).not_to have_link "Delete Product"      
    end
  end

  context "admin users" do
    before { login_as(admin) }

    it "can see the New Product link" do
      visit "/"
      expect(page).to have_link "New Product"
    end

    it "can see the Delete Product link" do
      visit product_path(product)
      expect(page).to have_link "Delete Product"      
    end
  end
end

require "rails_helper"

RSpec.describe "Our users can login" do
  let!(:user) { FactoryBot.create(:user) }


  it "with valid credentials" do
    visit "/"
    click_link "Login"
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_button "Log In"


    expect(page).to have_content "You Have Logged in Successfully."
    expect(page).to have_content "Logged in as #{user.email}"
  end
end

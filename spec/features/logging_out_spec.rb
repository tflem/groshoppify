require "rails_helper"

RSpec.feature "Our logged-in users can log out" do
	let!(:user) { FactoryBot.create(:user) }

  before do
    login_as(user)
  end

  it do
    visit "/"    
    click_link "Logout"
    expect(page).to have_content "You Have Logged Out Successfully."
  end
end
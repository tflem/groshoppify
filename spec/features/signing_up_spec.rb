require 'rails_helper'

RSpec.feature 'our users can sign up' do
  it 'when providing valid details' do
    visit '/'
    click_link 'Sign Up'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign Up'
    expect(page).to have_content('You have signed up successfully.')
  end
end

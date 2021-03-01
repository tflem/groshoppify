# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Our users can create notes' do
  before do
    product = FactoryBot.create(:product, name: 'Milk')

    visit product_path(product)
    click_link 'New Note'
  end

  it 'with valid attributes' do
    fill_in 'Name', with: 'No Skim!'
    fill_in 'Description', with: 'Pickup 2%, not skim milk!'
    click_button 'Create Note'

    expect(page).to have_content 'Your note has been created.'
  end

  it 'when providing invalid attributes' do
    click_button 'Create Note'

    expect(page).to have_content 'Your note has not been created.'
    expect(page).to have_content 'Name can\'t be blank'
    expect(page).to have_content 'Description can\'t be blank'
  end

  it 'with an invalid description' do
    fill_in 'Name', with: 'No Skim!'
    fill_in 'Description', with: 'Skim Bad'
    click_button 'Create Note'

    expect(page).to have_content 'Your note has not been created.'
    expect(page).to have_content 'Description is too short'
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Our users can edit current list of products' do
  before do
    FactoryBot.create(:product, name: 'Milk')

    visit '/'
    click_link 'Milk'
    click_link 'Edit Product'
  end

  it 'with valid attributes' do
    fill_in 'Name', with: '1/2 Gallon of Milk'
    click_button 'Update Product'

    expect(page).to have_content 'Product information has been updated.'
    expect(page).to have_content '1/2 Gallon of Milk'
  end

  it 'with invalid attributes' do
    fill_in 'Name', with: ''
    click_button 'Update Product'

    expect(page).to have_content 'Product information has not been updated.'
  end
end

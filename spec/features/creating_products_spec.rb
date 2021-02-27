# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Our users can create new products' do
  before do
    visit '/'

    click_link 'New Product'
  end

  it 'with valid attributes' do
    fill_in 'Name', with: 'Milk'
    fill_in 'Quantity', with: 2
    fill_in 'Description', with: 'Pickup two percent, not skim.'
    click_button 'Create Product'

    expect(page).to have_content 'Product information has been created.'

    product = Product.find_by(name: 'Milk')
    expect(page.current_url).to eq product_url(product)

    title = 'Milk - Products - Groshoppify'
    expect(page).to have_title title
  end

  it 'with invalid attributes' do
    click_button 'Create Product'

    expect(page).to have_content 'Product information has not been created.'
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Quantity can't be blank"
  end
end

require 'rails_helper'

RSpec.describe 'Our users can delete products' do
  scenario 'successfully' do
    FactoryBot.create(:product, name: "Milk")


    visit '/'
    click_link 'Milk'
    click_link 'Delete Product'


    expect(page).to have_content 'Product has been deleted.'
    expect(page.current_url).to eq products_url
    expect(page).to have_no_content 'Milk'
  end
end  



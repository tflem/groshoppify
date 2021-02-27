# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductsController, type: :request do
	it 'handles a product that does not exist' do
    product_path = '/products/not-here-bucko'
    get product_path


    expect(response).to redirect_to(products_path)


    message = 'The product you are looking for does not exist.'
    expect(flash[:alert]).to eq message
  end
end

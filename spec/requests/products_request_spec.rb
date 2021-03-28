# frozen_string_literal: true

require "rails_helper"

RSpec.describe ProductsController, type: :controller do
  it "handles a product that does not exist" do    
    get :show, params: { id: "no-id" }

    expect(response).to redirect_to(products_path)

    expect(flash[:alert]).to eq "The product you are looking for does not exist."
  end
end

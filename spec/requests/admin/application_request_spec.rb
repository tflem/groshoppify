require "rails_helper"

RSpec.describe Admin::ApplicationController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  before do
    allow(controller).to receive(:authenticate_user!)
    allow(controller).to receive(:current_user).and_return(user)
  end

  context "non-admin users" do
    it "cannot access the index action" do
      get :index

      expect(response).to redirect_to(root_path)
      expect(flash[:alert]).to eq "To pull that off, you must be an admin."
    end
  end
end

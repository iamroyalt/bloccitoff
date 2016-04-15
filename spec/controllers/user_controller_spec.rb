require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) {create(:user)}

  context "for signed in users" do

    it "returns http status after user signs in " do
      expect(response).to have_http_status :success
    end
  end 
end

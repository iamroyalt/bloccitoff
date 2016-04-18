require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) {create(:user)}

  context "for signed in users" do

    it "returns http status after user signs in " do
      expect(response).to have_http_status :success
    end

    it "sets current_user" do
      expect(subject.current_user).to eq(user)
    end
  end

  context "GET #show" do
    it "succeeds" do
      get :show, id: user.id
      expect(subject).to render_template(:show)
    end
  end
end

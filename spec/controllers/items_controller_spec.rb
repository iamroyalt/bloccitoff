require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:my_item) {create(:item, user: current_user)}
  let(:unconfirmed_user)

  context "current_user doing CRUD on an item" do
    before do
      sign_in current_user
    end

    describe "item create" do
      it "increase the number of items by 1" do
        expect {post :create, format: :js, user_id: current_user.id, item: {name:"test item"} }.to change(Item, :count).by(1)
      end

      it "returns http redirect" do
        post :create, user_id: current_user.id, item: {name: "test item"}
        expect(response).to have_http_status(:success)
      end
    end

    describe "DELETE destroy" do
      it "deletes the item" do
        delete :destroy, format: :js, user_id: current_user.id, id: my_item.id
        expect(count).to eq 0
      end

      it "returns http success" do
        delete :destroy, format: :js, user_id: current_user.id, id: my_item.id
        expect(response).to have_http_status(:success)
      end
    end
  end
end

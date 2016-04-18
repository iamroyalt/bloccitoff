require 'rails_helper'
require 'faker'

RSpec.describe ItemsController, type: :controller do

  let(:my_user) { create(:user) }
  let(:my_item) { create(:item, user: my_user) }

  context "signed in user doing CRUD on an item" do
  before do
    my_user.confirm
    sign_in my_user
  end


  describe "POST item create" do
    it "increases the number of Item by 1" do
      expect {post :create, user_id: my_user.id, item: {name: Faker::Company.catch_phrase}}.to change(Item,:count).by(1)
    end

    it "returns http direct" do
      post :create, user_id: my_user.id, item: {name: Faker::Company.catch_phrase}
      expect(response).to redirect_to User.last
    end
  end

  describe "DELETE destroy" do
    it "deletes the item" do
      delete :destroy, format: :js, user_id: my_user.id, id: my_item.id
      count = Item.where({id: my_item.id}).size
      expect(count).to eq 0
    end
  end
end
end

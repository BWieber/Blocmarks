require 'rails_helper'

RSpec.describe TopicsController, type: :controller do

  let (:my_topic) { create(:topic) }
  let (:user)     { create(:user) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: my_topic.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "instantiates @topic" do
      get :new
      expect(assigns(:topic)).not_to be_nil
    end
  end

  describe "POST create" do
    it "increases the number of Topic by 1" do
      expect{post :create, topic: {title: "My Title"}}.to change(Topic,:count).by(1)
    end

    it "assigns the new topic to @topic" do
      post :create, topic: {title: "My Title"}
      expect(assigns(:topic)).to eq Topic.last
    end

    it "redirects to the topics index" do
      post :create, topic: {title: "My Title"}
      expect(response).to redirect_to topics_path
    end
  end

  # describe "GET #edit" do
  #   it "returns http redirect" do
  #     get :edit, {id: my_topic.id}
  #     expect(response).to redirect_to(new_user_session_path)
  #   end
  # end

  describe "PUT update" do
    it "returns http redirect" do
      new_title = "My Edited Title"

      put :update, id: my_topic.id, topic: {title: new_title}
      expect(response).to redirect_to(:topic)
    end
  end

  describe "DELETE destroy" do
    it "returns http redirect" do
    delete :destroy, {id: my_topic.id}
    expect(response).to redirect_to(topics_path)
    end
  end

end

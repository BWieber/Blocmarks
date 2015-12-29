require 'rails_helper'

RSpec.describe LikesController, type: :controller do

  let(:my_user)     { create(:user) }
  let(:my_topic)    { create(:topic) }
  let(:my_bookmark) { create(:bookmark, user: my_user) }

  describe "POST create" do
    it "redirects to the topics show view" do
      post :create, { bookmark_id: my_bookmark.id }
      expect(response).to redirect_to topics_show_path)
    end

    it "creates a like for the current user and specified bookmark" do
      expect(my_user.likes.find_by_bookmark_id(my_bookmark.id)).to be_nil

      post :create, { bookmark_id: my_bookmark.id }

      expect(my_user.likes.find_by_bookmark_id(my_bookmark.id)).not_to be_nil
    end
  end
end

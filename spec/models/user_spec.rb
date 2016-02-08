require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { create(:user) }

  it { should validate_presence_of(:email) }
  it { should allow_value("user@bloccit.com").for(:email) }
  it { should_not allow_value("userbloccit").for(:email) }

  it { should validate_presence_of(:password) }
  it { should validate_length_of(:password).is_at_least(8) }

  it { should have_many(:likes) }

  describe "attributes" do

    it "should respond to username" do
      expect(user).to respond_to(:username)
    end

    it "should respond to email" do
      expect(user).to respond_to(:email)
    end
  end

  describe "invalid user" do
    let(:user_with_invalid_name)          { build(:user, username: "") }
    let(:user_with_invalid_email)         { build(:user, email: "") }
    let(:user_with_invalid_email_format)  { build(:user, email: "invalid_format") }

    it "should be invalid user due to a blank email" do
      expect(user_with_invalid_email).to_not be_valid
    end

    it "should be an invalid user due to an incorrectly formated email address" do
      expect(user_with_invalid_email_format).to_not be_valid
    end
  end

  describe "#like_for(bookmark)" do
    before do
      topic = create(:topic)
      @bookmark = topic.bookmarks.create(url: 'www.example.com')
    end


    it "returns `nil` if the user has not liked the bookmark" do
      expect(user.liked(@bookmark)).to be_nil
    end

    it "returns the appropriate like if it exists" do
      like = user.likes.where(bookmark: @bookmark).create

      expect(user.liked(@bookmark)).to eq(like)
    end
  end
end

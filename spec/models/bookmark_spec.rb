require 'rails_helper'

RSpec.describe Bookmark, type: :model do

  let(:user) { create(:user) }

  it { should have_many(:likes) }


end

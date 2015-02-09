require 'rails_helper'

describe VotesController do
  include Devise::TestHelpers

  before do
    request.env["HTTP_REFERER"] = '/'
    @user = create(:user)
    @post = create(:post, user: @user)
    sign_in @user
  end

  describe "#up_vote" do
    it "adds an up-vote to the post" do
      expect {
        post( :up_vote, post_id: @post.id )
      }.to change{ @post.up_votes }.by 1
    end
  end
end
require "rails_helper"

describe Vote do 
  describe "validations" do
    describe "value validation" do
      it "only allow -1 or 1 as value" do
        # expectations
        expect(Vote.new(value: 1).valid?).to eq(true)
        expect(Vote.new(value: -1).valid?).to eq(true)
        expect(Vote.new(value: 2).valid?).to eq(false)
      end
    end
  end

  describe "after_save" do
    it "calls 'Post#update_rank' after save" do
      user = create(:user)
      post = create(:post, user: user)
      vote = Vote.new(value: 1, post: post)
      expect(post).to receive(:update_rank)
      vote.save
    end
  end

  
end
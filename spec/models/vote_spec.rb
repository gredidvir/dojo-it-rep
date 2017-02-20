require 'rails_helper'

describe Vote do
  include TestFactories
  describe "validations" do
    describe "value validation" do
      before do
          user = User.new
          post = Post.new
          @vote1 = Vote.new(value: 1, user:user, post:post)
          @voteminus = Vote.new(value: -1, user:user, post:post)
          @vote2 = Vote.new(value: 2, user:user, post:post)
        end
      it "only allows -1 or 1 as values" do
        expect(@vote1.valid?).to eq true
        expect(@voteminus.valid?).to eq true
        expect(@vote2.valid?).to eq false
      end
    end
  end
  describe 'after_save' do
    it "calls `Post#update_rank` after save" do
      post = associated_post
      vote = Vote.new(value: 1, post: post)
      expect(post).to receive(:update_rank)
      vote.save
    end
  end
end
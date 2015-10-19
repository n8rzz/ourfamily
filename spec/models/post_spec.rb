require 'rails_helper'

describe Post, type: :model do
    before do
        # @post = Post.new(title: "A New Post Title", body: "Post body content", )
        @post = build(:post)
    end

    subject { @post }

    it { should respond_to(:title) }
    it { should respond_to(:body) }
    it { should respond_to(:published) }

    it { should be_valid }


    describe "when title is not present" do
        before { @post.title = " " }
        it { should_not be_valid }
    end

    describe "when title is longer than 50 chars" do
        before { @post.title = "a" * 51 }
        it { should_not be_valid }
    end

    describe "when body is not present" do
        before { @post.body = " " }
        it { should_not be_valid }
    end
end

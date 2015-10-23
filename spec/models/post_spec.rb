require 'rails_helper'

describe Post, type: :model do
  it 'has a valid factory' do
    expect(build(:post)).to be_instance_of(Post)
  end

  describe 'data and associations' do
    it { should have_db_column(:title) }
    it { should have_db_column(:body) }
    it { should have_db_column(:published) }
  end

  before do
    @post = build(:post)
  end

  subject { @post }

  it { should respond_to(:title) }
  it { should respond_to(:body) }
  it { should respond_to(:published) }
  it { should have_attached_file(:photo) }
  it { should be_valid }

  describe 'post image attachment' do
    it {
      should validate_attachment_content_type(:photo)
        .allowing('image/png', 'image/gif', 'image/jpg', 'image/jpeg')
        .rejecting('text/plain', 'text/xml')
    }
    it { should validate_attachment_size(:photo).less_than(10.megabytes) }
  end

  describe 'when title is not present' do
    before { @post.title = ' ' }
    it { should_not be_valid }
  end

  describe 'when title is longer than 50 chars' do
    before { @post.title = 'a' * 101 }
    it { should_not be_valid }
  end

  describe 'when body is not present' do
    before { @post.body = ' ' }
    it { should_not be_valid }
  end
end

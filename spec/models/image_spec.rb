require 'rails_helper'

describe Image, type: :model do
  it 'has a valid factory' do
    expect(build(:image)).to be_instance_of(Image)
  end

  describe 'data and associations' do
    it { should have_db_column(:name) }
    it { should have_db_column(:description) }
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end

  before do
    @image = build(:image)
  end

  subject { @image }

  it { should belong_to(:user) }
  it { should respond_to(:name) }
  it { should validate_presence_of(:name) }
  it { should respond_to(:description) }
  it { should validate_presence_of(:description) }
  it { should have_attached_file(:attachment) }
  # it { should validate_presence_of(:attachment) }
  it { should be_valid }

  describe 'attachment' do
    it do
      should validate_attachment_content_type(:attachment)
        .allowing('image/png', 'image/gif', 'image/jpg', 'image/jpeg')
        .rejecting('text/plain', 'text/xml')
    end
    it { should validate_attachment_size(:attachment).less_than(10.megabytes) }
  end

  describe 'when name is not present' do
    before { @image.name = ' ' }
    it { should_not be_valid }
  end

  describe 'when name is longer than 50 chars' do
    before { @image.name = 'a' * 101 }
    it { should_not be_valid }
  end

  describe 'when description is not present' do
    before { @image.description = ' ' }
    it { should_not be_valid }
  end
end

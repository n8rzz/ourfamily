require 'rails_helper'

describe User, type: :model do
  it 'has a valid factory' do
    expect(build(:user)).to be_instance_of(User)
  end

  describe 'data and associations' do
    it { should have_db_column(:first_name).of_type(:string) }
    it { should have_db_column(:last_name).of_type(:string) }
    it { should have_db_column(:birthday).of_type(:string) }
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:created_at).of_type(:datetime) }
    it { should have_db_column(:updated_at) }
    it { should have_db_column(:current_sign_in_at) }
    it { should have_db_column(:last_sign_in_at) }
    it { should have_db_column(:last_seen).of_type(:datetime) }
    it { should have_many(:posts).dependent(:destroy) }
    it { should have_many(:images) }
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:birthday) }
    it { should validate_length_of(:first_name).is_at_most(50) }
    it { should validate_length_of(:last_name).is_at_most(50) }
    it { should validate_length_of(:password).is_at_least(8) }
  end

  describe 'instance methods' do
    before { create(:user, first_name: 'Tom', last_name: 'Tomkins') }

    it 'should render a full user name' do
      expect { (user.name).to eq('Tom Tomkins') }
    end
  end
end

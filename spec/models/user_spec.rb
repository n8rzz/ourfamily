require 'rails_helper'

describe User, type: :model do
  it 'has a valid factory' do
    expect(build(:user)).to be_instance_of(User)
  end

  describe 'data and associations' do
    it { should have_db_column(:email) }
    it { should have_db_column(:created_at) }
    it { should have_db_column(:updated_at) }
    it { should have_db_column(:current_sign_in_at) }
    it { should have_db_column(:last_sign_in_at) }
    it { should have_many(:posts).dependent(:destroy) }
  end
end

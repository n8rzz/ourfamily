require 'rails_helper'

describe Family, type: :model do
  it 'has a valid factory' do
    expect(build(:family)).to be_instance_of(Family)
  end

  describe 'data and associations' do
    it { should have_db_column(:subdomain) }
  end

  before do
    @family = build(:family)
  end

  subject { @family }

  it { should respond_to(:subdomain) }
end

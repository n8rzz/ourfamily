require 'rails_helper'

describe 'read marks' do
  subject { page }

  let(:userOne) { create(:user, first_name: 'bob', last_name: 'smith') }
  let!(:userTwo) { create(:user, id: 2, first_name: 'Little', last_name: 'Blueberry', email: 'blue@example.com') }
  let!(:post) { create(:post) }

  before { visit root_path }

  describe 'when a post is viewed by one user' do
    before do
      sign_in userOne
      visit post_path(post)
    end

    it { should have_selector('ul.hlist', text: userOne.name) }

    describe 'then viewed by another user' do
      before do
        visit root_path
        sign_out_user
        sign_in(userTwo)
        visit post_path(post)
      end

      it { should have_selector('li', text: userOne.name) }
      it { should have_selector('li', text: userTwo.name) }
    end
  end

  describe 'when everyone has seen a post' do
    it 'displays with a seen by all css class'
    it 'contains seen by all'
  end
end

require 'rails_helper'

describe 'Application Pages' do
  subject { page }

  before do
    visit root_path
  end

  it { should have_selector('div.wrapper') }
  it { should have_selector('div.page') }
  it { should have_selector('div.page-hd') }
  it { should have_selector('div.page-bd') }
  it { should have_selector('div.page-ft') }
end

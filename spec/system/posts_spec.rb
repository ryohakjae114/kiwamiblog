require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  let(:user) { create(:user) }

  it '投稿を一覧できること' do
    create_list(:post, 11, user:)
    visit root_path
    expect(page).to have_css('.card', count: 10)
    expect(page).to have_css('.pagination')
  end
end

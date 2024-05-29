require 'rails_helper'

RSpec.describe 'Users::FollowingPosts', type: :system do
  let!(:hakjae) { create(:user, name: 'hakjae') }
  let!(:taji) { create(:user, name: 'taji') }
  let!(:micchan) { create(:user, name: 'micchan') }

  before do
    sign_in hakjae
    create(:post, user: taji)
    create(:post, user: micchan)
    hakjae.follow!(taji)
    hakjae.follow!(micchan)
  end

  it 'フォロー中のユーザの投稿を一覧できること' do
    visit root_path
    click_on 'フォロー中のユーザの投稿一覧'
    expect(page).to have_content('taji')
    expect(page).to have_content('micchan')
    hakjae.unfollow!(micchan)
    visit current_path
    expect(page).to have_content('taji')
    expect(page).not_to have_content('micchan')
  end
end

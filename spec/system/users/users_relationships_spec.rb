require 'rails_helper'

RSpec.describe 'Users::Relationships', type: :system do
  let!(:hakjae) { create(:user, name: 'hakjae') }
  let!(:taji) { create(:user, name: 'taji') }

  before do
    sign_in hakjae
  end

  it 'フォローできること' do
    visit user_path(taji)
    expect do
      click_on 'Follow'
    end.to change(hakjae.followings, :count).by(1)
    expect(page).to have_content('フォローしました')
  end

  it 'フォロー解除できること' do
    hakjae.follow!(taji)
    visit user_path(taji)
    expect do
      click_on 'Unfollow'
    end.to change(hakjae.followings, :count).by(-1)
    expect(page).to have_content('フォロー解除しました')
  end
end

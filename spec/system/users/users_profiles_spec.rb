require 'rails_helper'

RSpec.describe 'Users::Profiles', type: :system do
  let(:hakjae) { create(:user, name: 'hakjae', introduction: '', external_blog_url: '') }

  it 'プロフィールを編集できること' do
    sign_in hakjae
    visit root_path
    click_on 'hakjae'
    click_on 'プロフィール情報編集'
    fill_in '紹介文', with: 'りょはっちぇです'
    fill_in '外部URL', with: 'https://example.com'
    click_on '更新する'
    visit edit_profile_path
    expect(page).to have_field '紹介文', with: 'りょはっちぇです'
    expect(page).to have_field '外部URL', with: 'https://example.com'
  end
end

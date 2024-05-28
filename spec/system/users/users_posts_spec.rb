require 'rails_helper'

RSpec.describe 'Users::Posts', type: :system do
  let(:hakjae) { create(:user, name: 'hakjae', introduction: '', external_blog_url: '') }

  it '新規投稿作成できること' do
    sign_in hakjae
    visit root_path
    click_on '投稿作成'
    fill_in '本文', with: 'いい天気だわな'
    expect do
      click_on '登録する'
    end.to change(hakjae.posts, :count).by(1)
    expect(page).to have_content('新規登録しました')
  end
end

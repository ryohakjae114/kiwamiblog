require 'rails_helper'

RSpec.describe 'Users::Posts', type: :system do
  let(:hakjae) { create(:user, name: 'hakjae', introduction: '', external_blog_url: '') }

  before do
    sign_in hakjae
  end

  it '新規投稿作成できること' do
    visit root_path
    click_on '投稿作成'
    fill_in '本文', with: 'いい天気だわな'
    expect do
      click_on '登録する'
    end.to change(hakjae.posts, :count).by(1)
    expect(page).to have_content('新規登録しました')
  end

  it '投稿を編集できること' do
    create(:post, user: hakjae, body: 'おはよう')
    visit root_path
    within('.card') do
      click_on('編集')
    end
    fill_in '本文', with: 'おやすみ'
    click_on('更新する')
    expect(page).to have_content('更新しました')
    expect(page).to have_content('おやすみ')
  end
end

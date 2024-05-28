require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let(:hakjae) { create(:user, name: 'hakjae', introduction: 'りょはっちぇです', external_blog_url: 'https://example.com') }

  it 'ユーザ情報を閲覧できること' do
    sign_in hakjae
    create(:post, user: hakjae)
    visit root_path
    within('.card') do
      click_on 'hakjae'
    end
    expect(page).to have_content('hakjae')
    expect(page).to have_content('りょはっちぇです')
    expect(page).to have_content('https://example.com')
  end
end

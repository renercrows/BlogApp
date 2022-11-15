require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  before :each do
    @user1 = User.create(name: 'Milo', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from New York.')
    Post.create(user: @user1, title: 'Title', text: 'Creating post')
    Post.create(user: @user1, title: 'hello', text: 'Creating post')
    Post.create(user: @user1, title: 'Hill', text: 'Creating post')
  end

  RSpec.configure do |config|
    config.include RSpecHtmlMatchers
  end

  it 'show usernames' do
    visit '/'
    expect(page).to have_content(@user1.name)
  end

  describe 'user index view' do
    it 'show profile picture' do
      visit '/'
      expect(page).to have_tag('img', src: @user1.photo)
    end

    it 'show link of profile picture' do
      visit '/'
      expect(page).to have_tag('link')
    end
  end

  it 'show total number of post created' do
    visit '/'
    expect(page).to have_content(@user1.posts_counter)
  end
end

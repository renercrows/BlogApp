require 'rails_helper'

RSpec.describe User, type: :feature do
describe 'user show view' do
    it 'show usernames' do
      visit "/users/#{@user1.id}"
      expect(page).to have_content(@user1.name)
    end

    it 'show total number of post created' do
      visit "/users/#{@user1.id}"
      expect(page).to have_content(@user1.posts_counter)
    end

    it 'show each user bio' do
      visit "/users/#{@user1.id}"
      expect(page).to have_content(@user1.bio)
    end

    it "show the user's first 3 posts " do
      visit "/users/#{@user1.id}"
      expect(page).to have_content(@user1.posts[0].text)
      expect(page).to have_content(@user1.posts[1].text)
      expect(page).to have_content(@user1.posts[2].text)
    end

    it "show view all of a user's posts" do
      visit "/users/#{@user1.id}"

      expect(page).to have_tag('button')
    end

    it 'when you click to an user, redirects to post index page' do
      visit "/users/#{@user1.id}"
      expect(page).to have_tag('a', href: user_posts_path(@user1))
    end

    it 'when you click to an user, redirects to post show page' do
      visit "/users/#{@user1.id}"
      expect(page).to have_tag('a', href: user_post_path(@user1, @user1.posts[0].id))
    end
  end
require 'rails_helper'

RSpec.describe Post, type: :feature do
describe 'post/show' do
    before(:each) do
      visit "users/#{@user1.id}/posts/#{@user1.posts[0].id}"
    end

    it 'show who wrote the post.' do
      expect(page).to have_content(@post1.user.name)
    end

    it 'show how many comments it has.' do
      expect(page).to have_content(@post1.comments_counter)
    end

    it 'show how many likes it has.' do
      expect(page).to have_content(@post1.likes_counter)
    end

    it 'show the post body.' do
      expect(page).to have_content(@post1.text)
    end

    it 'show the username of each commentor.' do
      expect(page).to have_content(@comment1.user.name)
    end

    it 'show the comment each commentor left.' do
      expect(page).to have_content(@comment1.text)
    end
end

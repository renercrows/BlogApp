require 'rails_helper'

RSpec.describe Post, type: :feature do
  before :each do
    @user1 = User.create(name: 'Dave',
                         photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgGzZ0z42r96DLQES7kolpBPw5xM2UqS04GKKYyZiF&s', bio: 'Teacher from Brazil.')

    @post1 = Post.create(user: @user1, title: 'Hello', text: 'This is my first post')
    @post2 = Post.create(user: @user1, title: 'Title 2', text: 'This is my second post')

    @comment1 = Comment.create(post: @post1, user: @user1, text: 'Hi Luisa!')
    @comment2 = Comment.create(post: @post2, user: @user1, text: 'Hi Samuel!')
  end

  describe "post/show" do
    include RSpecHtmlMatchers

    before(:each) do
      visit "users/#{@user1.id}/posts/#{@user1.posts[0].id}"
    end

    it "show who wrote the post." do
      expect(page).to have_content(@post1.user.name)
    end

    it "show how many comments it has." do
      expect(page).to have_content(@post1.comments_counter)
    end

    it "show how many likes it has." do
      expect(page).to have_content(@post1.likes_counter)
    end

    it "show the post body." do
      expect(page).to have_content(@post1.text)
    end

    it "show the username of each commentor." do
      expect(page).to have_content(@comment1.user.name)
    end

    it "show the comment each commentor left." do
      expect(page).to have_content(@comment1.text)
    end
  end
end

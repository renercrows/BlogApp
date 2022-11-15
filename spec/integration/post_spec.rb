require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  before :each do
    @user1 = User.create(name: 'Dave',
                         photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgGzZ0z42r96DLQES7kolpBPw5xM2UqS04GKKYyZiF&s', bio: 'Teacher from Brazil.')
    @post1 = Post.create(user: @user1, title: 'Hello', text: 'This is my first post')
    @post2 = Post.create(user: @user1, title: 'Title 2', text: 'This is my second post')
    @comment1 = Comment.create(post: @post1, user: @user1, text: 'Good morning')
    @comment2 = Comment.create(post: @post2, user: @user1, text: 'Good afternoon')
  end

  describe 'post/index' do
    include RSpecHtmlMatchers

    before(:each) do
      visit "/users/#{@user1.id}/posts"
    end

    it "show the user's profile picture." do
      expect(page).to have_tag('img', src: @user1.photo)
    end

    it "show the user's username." do
      expect(page).to have_content(@user1.name)
    end

    it 'show the number of posts the user has written.' do
      expect(page).to have_content(@post1.comments_counter)
    end

    it "show some of the post's body." do
      expect(page).to have_content(@post1.text)
    end

    it 'show how many comments a post has.' do
      expect(page).to have_content(@post1.comments_counter)
    end

    it 'show how many likes a post has.' do
      expect(page).to have_content(@post1.likes_counter)
    end

    it "When I click on a post, it redirects me to that post's show page." do
      expect(page).to have_tag('a', href: user_post_path(@user1, @user1.posts[0].id))
    end
  end
end

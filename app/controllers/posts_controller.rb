class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @posts = @user.posts.includes(comment: [:user])
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = @post.comment
  end

  def new
    post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: } }
    end
  end

  def create
    post = Post.new(params.require(:post).permit(:title, :text))
    post.user = current_user
    respond_to do |format|
      format.html do
        if post.save
          redirect_to user_posts_path(current_user.id), notice: 'Post successfully created'
        else
          flash.now[:notice] = "Error: Couldn't create post"
          render :new, locals: { post: }
        end
      end
    end
  end
end

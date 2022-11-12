class CommentsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment)
    @comment.user = current_user
    @comment.post = @post
    if @comment.save
      redirect_to user_post_path(@user, @post)
    else
      flash.now[:error] = 'There is an error'
    end
  end

  def comment
    params.require(:comment).permit(:text)
  end
end

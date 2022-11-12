class CommentsController < ApplicationController
    def create
        @user = User.find(params[:user_id])
        @post = Post.find(params[:post_id])
        @comment = Comment.new(comment_params)
        @comment.user = current_user
        @comment.post = @post
    
        if @comment.save
          redirect_to user_post_path(@user, @post)
        else
          flash.now[:error] = 'There is an error'
        end
      end
    
      def comment_params
        params.require(:comment).permit(:text)
      end
end

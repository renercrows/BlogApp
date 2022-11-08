module PostHelper
  def index
    @posts = Post.where(user_id: params(:user_id))
  end

  def show
    @post = Post.find(params[:id])
  end
end

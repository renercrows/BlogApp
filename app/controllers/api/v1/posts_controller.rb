class Api::V1::PostsController < Api::V1::ApplicationController
  before_action :authenticate_user!
  def index
    user = User.find(params[:user_id])
    posts = user.posts.includes(comment: [:user])
    render json: posts, status: :ok
  end

  def show
    post = Post.where(id: params[:id])
    render json: post, status: :ok
  end
end

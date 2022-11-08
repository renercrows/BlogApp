module UsersHelper
  def index
    @user = User.find(user_id: params(:user_id))
  end

  def show
    @user = User.find(params[:user_id])
  end
end

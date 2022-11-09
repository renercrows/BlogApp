module UsersHelper
  def index; end

  def show
    params[:user_id]
  end
end

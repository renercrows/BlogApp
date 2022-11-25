class Api::V1::CommentsController < Api::V1::ApplicationController
  class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    respond_to :json
  end
end

class Api::V1::CommentsController < Api::V1::ApplicationController
  before_action :authenticate_user!
  respond_to :json
end

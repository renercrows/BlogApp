require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/index'
      expect(response).to have_http_status(:success)
    end

    it 'renders index template' do
      get '/'
      expect(response).to render_template(:index)
    end

    it 'should return the user index title' do
      get '/'
      expect(response.body).to include('Here are all the users')
    end
  end

  describe 'GET /show' do
    before(:each) do
      get '/users/show'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'should return show' do
      expect(response).to render_template(:show)
    end

    it 'should return the user show title' do
      expect(response.body).to include('Just one user')
    end
  end
end

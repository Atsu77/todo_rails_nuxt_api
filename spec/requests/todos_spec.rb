require 'rails_helper'

RSpec.describe 'Todos', type: :request do
  before(:each) do
    @user = create(:user)
    @todo = create(:todo, user: @user)
  end

  describe 'GET /todos' do
    it 'リクエストが成功すること' do
      get '/api/v1/todos'
      expect(response.status).to eq 200
    end
  end

  describe 'POST /todos' do
    it 'リクエストが成功すること' do
      params = { name: 'test', user_id: @user.id }
      post '/api/v1/todos', params: { todo: params }
      expect(response.status).to eq 201
    end
  end

  describe 'PUT /todos/1' do
    it 'リクエストが成功すること' do
      params = { name: 'update_name', user_id: @user.id }
      put "/api/v1/todos/#{@todo.id}", params: { todo: params }
      expect(response.status).to eq 200
    end
  end

   describe "DELETE /todos/1" do
    it 'リクエストが成功すること' do
      delete "/api/v1/todos/#{@todo.id}"
      expect(response.status).to eq 200
    end
   end
end

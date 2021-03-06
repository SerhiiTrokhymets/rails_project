# frozen_string_literal: true
class Blog::Auth < Grape::API
  helpers Blog::Helpers::Posts

  namespace :auth do
    desc 'Log in'
    params do
      requires :email, type: String
      requires :password, type: String
    end

    post do
      user = User.authenticate(params[:email], params[:password])
      payload = { user_id: user.id }
      token = JWT.encode payload, nil, 'none'

      { token: token }
    end

    desc 'Check auth'
    params do
      requires :token, type: String
    end
    get do
      user = User.find(decode['user_id'])
      user
    end
  end
end

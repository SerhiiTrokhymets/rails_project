class Blog::API < Grape::API
  format :json
  mount Blog::Posts => 'api/v1'
  mount Blog::Auth => 'api/v1'
end
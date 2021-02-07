class Blog::API < Grape::API
  format :json
  mount Blog::Posts => 'api/v1'
end
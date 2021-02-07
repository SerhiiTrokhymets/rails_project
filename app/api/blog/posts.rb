class Blog::Posts < Grape::API
  helpers Blog::Helpers::Posts

  namespace :posts do
    get do
      posts = Post.published
      present posts, with: Blog::Entities::AllPosts
    end

    params do
      requires :id
      requires :user_id
      optional :title, type: String
      optional :body, type: String
    end

    get ':id' do
      post = User.find(params[:user_id]).posts.find(params[:id])
      present post, with: Blog::Entities::Posts
    end

    post do
      User.find(params[:user_id]).posts.find(params[:id]).update(declared_params)
    end

    post '/published' do
      User.find(params[:user_id]).posts.find(params[:id]).published
    end

    post '/unpublished' do
      User.find(params[:user_id]).posts.find(params[:id]).unpublished
    end

    delete ':id' do
      User.find(params[:user_id]).posts.find(params[:id]).destroy
    end
  end
end

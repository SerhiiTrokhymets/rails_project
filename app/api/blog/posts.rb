# frozen_string_literal: true
class Blog::Posts < Grape::API
  helpers Blog::Helpers::Posts
  helpers do
    params :update_posts do
      requires :user_id
      optional :title
      optional :body
    end

    params :post_create do
      requires :user_id
      requires :title, type: String
      requires :body, type: String
    end
  end

  namespace :posts do
    get do
      posts = Post.publish
      present posts, with: Blog::Entities::AllPosts
    end

    params do
      requires :user_id
    end

    get ':post_id' do
      user = User.find_by(id: params[:user_id])
      error!('Not find user', 404) unless user
      post = user.posts.find_by(id: params[:post_id])
      error!('Not find post', 404) unless post
      present post, with: Blog::Entities::Posts
    end

    desc 'Update post.'
    params { use :update_posts }
    put ':post_id' do
      post = Post.find_by(id: params[:post_id], user_id: params[:user_id])
      error! ('Not find user or post') unless post
      post.update(declared_params)
    end

    post ':post_id/publish' do
      post = Post.find_by(id: params[:post_id], user_id: params[:user_id])
      error! ('Not find user or post') unless post
      post.publish
    end

    post ':post_id/unpublish' do
      post = Post.find_by(id: params[:post_id], user_id: params[:user_id])
      error! ('Not find user or post') unless post
      post.unpublish
    end

    params { use :post_create }
    post do
      Post.create(params)
    end

    params do
      requires :user_id
    end
    delete ':post_id' do
      post = Post.find_by(id: params[:post_id], user_id: params[:user_id])
      error! ("Not find post in user #{User.find_by(id: params[:user_id]).first_name}") unless post
      post.destroy
    end

    params do
      requires :user_id
    end
    post ':post_id/image' do
      post = User.find_by(id: params[:user_id]).posts.find_by(id: params[:post_id])
      post.images.create(url: params[:url])
    end
  end
end

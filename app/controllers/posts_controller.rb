class PostsController < ApplicationController
  def index
    @posts = Post.all
    render layout: 'my_layout'
  end
  def show
    @post = Post.find_by(id: params[:id])
    @image = Image.find_by(id: params[:id])
  end
end


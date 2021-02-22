class PostsController < ApplicationController
  # users/:id/posts/ GET
  def index
  end

  # users/:id/posts/:id GET
  def show
    @post = Post.find_by(id: params[:id])
    user_id = @post.user_id
    @user = User.find_by(id: user_id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.errors.empty?
      redirect_to post_path(@post.id)
    else
      render plain: 'Post not saved'
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post = Post.update(post_params)
    if @post.errors.empty?
      redirect_to post_path
    else
      render plain: 'Post not update'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end

class UsersController < ApplicationController

  # /users/
  def index
    @users = User.all
  end

  # /users/1 GET
  def show
    unless @user = User.find_by(id: params[:id])
      render plain: 'Page not found'
    end
  end

  #/users/new GET
  def new
  end

  #/users/edit GET
  def edit
    @user = User.find_by(id: params[:post_id])
  end

  #users/create POST
  def create
    @user = User.create(user_params)
    if @user.errors.empty?
      redirect_to "/users/#{@user.id}"
    else
      render 'new'
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update(user_params)
    if @user.errors.empty?
      redirect_to user_path(@user)
    else
      render 'users/edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :personal_data, :email, :password, :birthday)
  end
end
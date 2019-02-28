class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @bookmark = @user.bookmarks.build
    @bookmarks = @user.bookmarks
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(session[:user_id])
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
      
  end

  def destroy
    @user = User.find_by(id: session[:user_id])
    @user.destroy
    redirect_to root_url
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end

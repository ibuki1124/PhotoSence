class UsersController < ApplicationController
  before_action :is_login_user?, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def index
    @users = User.all
  end

  def edit
  end
  
  def update
    user.update(user_params)
    redirect_to user_path(user)
  end
end

private
def user_params
  params.require(:user).permit(:name)
end

def is_login_user?
  @user = User.find(params[:id])
  unless @user.id == current_user.id
    redirect_to user_path(@user)
  end
end
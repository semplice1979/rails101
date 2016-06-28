class UsersController < ApplicationController
before_action :authenticate_user!
def index
  @user = User.all
end
def show
  @user = User.find(params[:id])
  #@user = User.all
end
def new
  @user = User.new
end
def edit
  @user = User.find(params[:id])
end
private
  def user_params
      params.require(:user).permit(:email, :name)
  end

end

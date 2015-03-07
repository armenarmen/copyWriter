# require bcrypt

class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
  end

  def new
    @user = User.new
  end

  def edit
  end

  private

    def user_params
      params.require(:user).permit(:full_name, :email, :password,
                                   :password_confirmation)
    end
end

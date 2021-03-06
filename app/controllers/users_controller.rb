# require bcrypt

class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @emails = @user.emails.paginate(:page => params[:page], :per_page => 5)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
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

  # def emails
  #   @user = User.find(params[:id])
  #   Rails.logger.info("    >>>>>>>>>>>  >>>>>> #{params[:id]}")
  #   # @emails = Email.where(user_id: params[:id])
  #   # Rails.logger.info("    >>>>>>>>>>>  >>>>>> #{@emails}")
  #   # Rails.logger.info("    >>>>>>>>>>>  >>>>>> #{params[:id]}")
  # end

  private

    def user_params
      params.require(:user).permit(:full_name, :email, :password,
                                   :password_confirmation)
    end
end

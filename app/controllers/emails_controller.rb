class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def show
  end

  def create
    @email = current_user.emails.new(user_params)
    # @user = User.new(user_params)
    if @email.save
      # log_in @user
      flash[:success] = "Email Written"
      redirect_to :root
    else
      render 'new'
    end
  end

  def update
  end

  def new
    @email = Email.new
  end

  def edit
  end

  private

  def user_params
    params.require(:email).permit(:subject, :body, :comment, :user_id)
  end
end

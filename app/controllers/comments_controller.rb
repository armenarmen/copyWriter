class CommentsController < ApplicationController
  def index
    #rmv
  end

  def show
    # rm
  end

  def create
    @email = Email.find(comment_params[:email_id])
    @comment =  @email.comments.new(comment_params)
    if @comment.save
      flash[:success] = "Comment Written"
      redirect_to :back
    else
      render 'new'
    end
  end

  def update
    #rm
  end

  def new
    #rm
  end

  def edit
    #rm
  end

  private

  def comment_params
    params.require(:comment).permit(:subject, :body, :message, :user_id, :email_id)
  end

end

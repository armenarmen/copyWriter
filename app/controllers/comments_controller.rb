class CommentsController < ApplicationController
  def index
    #rmv
    # actually I need this.
  end

  def show
    # rm
    #redefine it so that this only shows the top one.
  end

  def create
    @email = Email.find(comment_params[:email_id])
    @comment =  @email.comments.new(comment_params)
    if @comment.save
      flash[:success] = "Comment Written"
      redirect_to :back
    else
      flash[:success] = "didn't work"
      redirect_to :back
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
    params.require(:comment).permit(:message, :user_id, :email_id, :char_began_at, :char_ended_at)
  end

end

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @recording = Recording.find(params[:recording_id])

    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.recording = @recording

    if @comment.save
      redirect_to @recording, notice: 'Your comment was added!'
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end

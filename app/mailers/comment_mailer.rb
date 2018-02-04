class CommentMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def recording_comment(comment)
    @comment = comment
    @commenter = @comment.user
    @recording = @comment.recording
    @user = @recording.user

    @url  = recording_url(@recording)

    mail(to: @user.email, subject: 'New SWAG Recording Comment')
  end
end

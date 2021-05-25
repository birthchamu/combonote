class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to combo_path(comment.combo)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, combo_id: params[:combo_id])
  end

end

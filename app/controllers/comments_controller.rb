class CommentsController < ApplicationController
  def create
    @comment = @combo.comments.build(comment_params)
    @comment.user_id = current_user.id
    redirect_to combo_path(comment.combo)
  end

  def destroy
    @combo = Combo.find(params[:id])
    @comment = Comment.find_by(id: params[:id],combo_id: params[:combo_id]).destroy
    redirect_to combo_path(comment.combo)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, combo_id: params[:combo_id])
  end

end

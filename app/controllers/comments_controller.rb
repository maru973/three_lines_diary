class CommentsController < ApplicationController
  def create
    @diary = Diary.find(params[:diary_id])
    # 現在のユーザーと取得したdiaryに紐づく新しいcommentをビルドする
    @comment = current_user.comments.build(comment_params.merge(diary: @diary))
    @comment.save
  end

  def edit
    @comment = current_user.comments.find(params[:id])
  end

  def update
    @comment = current_user.comments.find(params[:id])
    @comment.update(comment_params)
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy!
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end

class DiariesController < ApplicationController
  def index
    @diaries = Diary.includes(:user)
  end

  def new
    @diary = Diary.new
  end

  def create
    @diary = current_user.diaries.build(diary_params)
    if @diary.save
      redirect_to diaries_path, success: "Today's Diary was created!"
    else
      flash.now[:danger] = "We can't create your diary. Could you try adain?"
      render :new, status: :unprocessable_entity
    end 
  end

  def show
    @diary = Diary.find(params[:id])
    @comment = Comment.new
    @comments = @diary.comments.includes(:user).order(created_at: :desc)
  end

  def edit
    @diary = current_user.diaries.find(params[:id])
  end

  def update
    @diary = current_user.diaries.find(params[:id])
    if @diary.update(diary_params)
      redirect_to diary_path(@diary), success: "Your Diary was updated!"
    else
      flash.now[:danger] = "We can't update your diary. Could you try adain?"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @diary = current_user.diaries.find(params[:id])
    @diary.destroy!
    redirect_to diaries_path, status: :see_other, success: "Your Diary was deleted."
  end

  def bookmarks
    @bookmark_diaries = current_user.bookmark_diaries.includes(:user).order(created_at: :desc)
  end

  private

  def diary_params
    params.require(:diary).permit(:first_line, :second_line, :third_line, :diary_image, :diary_image_cache)
  end
end

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

  end

  private

  def diary_params
    params.require(:diary).permit(:first_line, :second_line, :third_line)
  end
end

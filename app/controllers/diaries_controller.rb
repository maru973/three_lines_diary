class DiariesController < ApplicationController
  require 'httpclient'
  require 'cgi' 
  require 'deepl'

  def index
    @diaries = Diary.includes(:user)
  end

  def new
    @diary = Diary.new
  end

  def create
    @diary = current_user.diaries.build(diary_params)
    @translated_first_line = translate_to_english_back(@diary.first_line)
    @translated_second_line = translate_to_english_back(@diary.second_line)
    @translated_third_line = translate_to_english_back(@diary.third_line)

    @diary.translated_first_line = @translated_first_line
    @diary.translated_second_line = @translated_second_line
    @diary.translated_third_line = @translated_third_line
    @diary.translated = true

    @diary.set_diary_title

    if @diary.save
      redirect_to diary_path(@diary), success: "Today's Diary was created!"
    else
      flash.now[:danger] = "We can't create your diary. Could you try adain?"
      render :new, status: :unprocessable_entity
    end 
  end

  def show
    @diary = Diary.find(params[:id])
    @translated_first_line = @diary.translated_first_line
    @translated_second_line = @diary.translated_second_line
    @translated_third_line = @diary.translated_third_line
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

  def translate_to_english_back(diary)
    api_key = ENV['DEEPL_KEY']
    uri = "https://api-free.deepl.com/v2/translate"
    client = HTTPClient.new
  
    client.ssl_config.clear_cert_store
    client.ssl_config.set_trust_ca("/etc/ssl/certs")
    # ここでSSLなどの証明書情報を設定します。
  
    # 英語から日本語への翻訳
    params_to_japanese = {
      auth_key: api_key,
      text: diary,
      target_lang: "JA"
    }
  
    response_to_japanese = client.get(uri, params_to_japanese)
    parsed_response_to_japanese = JSON.parse(response_to_japanese.body)
  
    japanese_text = parsed_response_to_japanese["translations"][0]["text"]
  
    # 日本語から英語への翻訳
    params_to_english = {
      auth_key: api_key,
      text: japanese_text,
      target_lang: "EN"
    }
  
    response_to_english = client.get(uri, params_to_english)
    parsed_response_to_english = JSON.parse(response_to_english.body)
  
    english_text = parsed_response_to_english["translations"][0]["text"]

    english_text
  end
end

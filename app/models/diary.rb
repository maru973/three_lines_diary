class Diary < ApplicationRecord
  belongs_to :user
  
  before_validation :set_diary_title

  VALID_ENGLISH_REGEX = /^[ -~]*$/
  validate :english_only

  validates :first_line, presence: true, length: { maximum: 255 }
  validates :second_line, presence: true, length: { maximum: 255 }
  validates :third_line, presence: true, length: { maximum: 255 }
  validates :title, presence: true

  private

  def set_diary_title
    # ユーザーごとにそのユーザーの日記数を取得
    user_diaries_count = user.diaries.count

    # 日記数に基づいてタイトルを生成
    self.title = "Day#{user_diaries_count + 1}"
  end

  def english_only
    unless [first_line, second_line, third_line].all? { |line| line =~ VALID_ENGLISH_REGEX }
      errors.add(:base, "You can't use Japanese.")
    end
  end
end

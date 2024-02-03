class Diary < ApplicationRecord
  mount_uploader :diary_image, DiaryImageUploader
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  
  before_validation :set_diary_title

  validate :english_only

  validates :first_line, presence: true, length: { maximum: 255 }
  validates :second_line, presence: true, length: { maximum: 255 }
  validates :third_line, presence: true, length: { maximum: 255 }
  validates :title, presence: true

  private

  def set_diary_title
    # 直近の日記のタイトルを取得
    last_diary = user.diaries.order(created_at: :desc).first

    if last_diary
      # 直近の日記が存在する場合は、その日記のタイトルに基づいて次のタイトルを生成
      last_diary_number = last_diary.title.scan(/\d+/).first.to_i
      self.title = "Day#{last_diary_number + 1}"
    else
      # 直近の日記が存在しない場合は、初めての日記なので "Day1" を設定
      self.title = "Day1"
    end
  end

  def english_only
    valid_english_regex = /^[ -~]*$/
    unless [first_line, second_line, third_line].all? { |line| line =~ valid_english_regex }
      errors.add(:base, "You can't use Japanese.")
    end
  end
end

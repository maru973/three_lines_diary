class Comment < ApplicationRecord
  belongs_to :diary
  belongs_to :user

  validates :body, presence: true, length: { maximum: 65_535 }
end

class AddDiaryImageToDiaries < ActiveRecord::Migration[7.0]
  def change
    add_column :diaries, :diary_image, :string
  end
end

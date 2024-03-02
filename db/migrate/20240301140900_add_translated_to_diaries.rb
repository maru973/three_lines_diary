class AddTranslatedToDiaries < ActiveRecord::Migration[7.0]
  def change
    add_column :diaries, :translated_first_line, :string
    add_column :diaries, :translated_second_line, :string
    add_column :diaries, :translated_third_line, :string
    add_column :diaries, :translated, :boolean, default: false
  end
end

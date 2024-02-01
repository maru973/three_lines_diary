class CreateDiaries < ActiveRecord::Migration[7.0]
  def change
    create_table :diaries do |t|
      t.string :title, null: false
      t.string :first_line, null: false
      t.string :second_line, null: false
      t.string :third_line, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

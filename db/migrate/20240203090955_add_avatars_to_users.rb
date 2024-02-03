class AddAvatarsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :avatars, :string
  end
end

class AddUserToHabbits < ActiveRecord::Migration[8.1]
  def change
    add_reference :habbits, :user, null: false, foreign_key: true
  end
end

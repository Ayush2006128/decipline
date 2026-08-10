class CreateHabbits < ActiveRecord::Migration[8.1]
  def change
    create_table :habbits do |t|
      t.string :description
      t.boolean :completion_status
      t.date :due_date

      t.timestamps
    end
  end
end

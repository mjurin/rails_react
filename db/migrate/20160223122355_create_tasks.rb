class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.string :description
      t.date :completed_on
      t.date :due_date_on
      t.timestamps null: false
    end
  end
end

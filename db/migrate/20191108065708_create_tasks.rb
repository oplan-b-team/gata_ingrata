class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :work_id
      t.date :date
      t.datetime :finish_time
      t.string :man_hour

      t.timestamps
    end
  end
end

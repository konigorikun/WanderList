class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.string     :title,         null: false
      t.string     :region,        null: false
      t.datetime   :start_time,    null: false
      t.datetime   :end_time,      null: false
      t.integer    :budget
      t.references :user,          null: false, foreign_key: true
      t.timestamps
    end
  end
end

class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.references :group, null: false, foreign_key: true
      t.string :title
      t.text :content
      t.datetime :start
      t.datetime :finish

      t.timestamps
      t.index [:room_id]
    end
  end
end

class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.text :name
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.integer :user_id
      t.integer :cancel_activities

      t.timestamps
    end
  end
end

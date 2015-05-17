class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :user_id
      t.string :event_name
      t.date :event_date
      t.text :event_description

      t.timestamps
    end
  end
end

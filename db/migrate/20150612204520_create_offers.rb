class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :user_id
      t.string :event_name
      t.date :event_date
      t.text :event_description
      t.boolean :is_active
      t.float :starting_price
      t.float :actual_price
      t.datetime :expire_date
      t.boolean :is_auction

      t.timestamps
    end
  end
end

class FullUpdateToDiagram < ActiveRecord::Migration
  def change
    add_column :users, :isModerator, :boolean 

    create_table :bid_offers do |t|
      t.integer :user_id
      t.integer :offer_id
      t.float :value

      t.timestamps
    end
    
    create_table :purchases do |t|
      t.integer :user_id
      t.integer :offer_id
      t.float :paid_value
      t.boolean :is_cancelled

      t.timestamps
    end
  end
end

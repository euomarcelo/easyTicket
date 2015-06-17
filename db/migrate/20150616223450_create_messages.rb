class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :userSent
      t.integer :userReceive
      t.string :message
      t.datetime :createdAt

      t.timestamps
    end
  end
end

class CreatePilaPacks < ActiveRecord::Migration
  def change
    create_table :pila_packs do |t|
      t.string :name
      t.integer :real_value
      t.integer :pila_value

      t.timestamps
    end
  end
end

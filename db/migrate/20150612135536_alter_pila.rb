class AlterPila < ActiveRecord::Migration
  def change
    change_column :pila_packs, :real_value,  :float
    change_column :pila_packs, :pila_value,  :float
  end
end
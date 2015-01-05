class AddNewColumnsToOrderTable < ActiveRecord::Migration
  def change
    add_column :orders, :subtotal,:integer
    add_column :orders, :tax,:integer
    add_column :orders, :shipping,:integer
    add_column :orders, :order_status_id,:integer

  end
end

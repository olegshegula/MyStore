class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :item_id
      t.integer :order_id
      t.integer :unit_price
      t.integer :quantity
      t.float :total_price

      t.timestamps
    end
  end
end

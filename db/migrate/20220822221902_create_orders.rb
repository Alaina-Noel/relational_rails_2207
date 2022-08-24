class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.boolean :gift
      t.string :order_type

      t.timestamps
    end
  end
end

class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :client
      t.string :description
      t.integer :unit_price
      t.integer :amount
      t.string :address
      t.string :supplier
      t.timestamps null: false
    end
  end
end

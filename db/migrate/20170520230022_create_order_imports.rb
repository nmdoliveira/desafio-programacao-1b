class CreateOrderImports < ActiveRecord::Migration
  def change
    create_table :order_imports do |t|
      t.references :order, index: true, foreign_key: true
      t.references :import, index: true, foreign_key: true
    end
  end
end

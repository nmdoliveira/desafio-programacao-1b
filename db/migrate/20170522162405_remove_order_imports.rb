class RemoveOrderImports < ActiveRecord::Migration
  def change
    drop_table :order_imports do |t|
      t.references :order, index: true, foreign_key: true
      t.references :import, index: true, foreign_key: true
    end
  end
end

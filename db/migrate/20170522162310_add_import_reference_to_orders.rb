class AddImportReferenceToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :import, index: true, foreign_key: true
  end
end

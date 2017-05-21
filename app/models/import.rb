class Import < ActiveRecord::Base
  has_many :order_imports
  has_many :orders, through: :order_imports

  def total
    orders.inject(0) { |total, order| total + order.total }
  end
end

class Import < ActiveRecord::Base
  enum status: %i(success fail)

  has_many :orders

  def total
    orders.inject(0) { |total, order| total + order.total }
  end

  def fail!(message: nil)
    update status: :fail, message: message
  end
end

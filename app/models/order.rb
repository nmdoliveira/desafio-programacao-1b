class Order < ActiveRecord::Base
  validates :client, :description, :unit_price, :amount, :address, :supplier,
    presence: true
  validates :unit_price, :amount, numericality: true

  def total
    amount * unit_price
  end
end

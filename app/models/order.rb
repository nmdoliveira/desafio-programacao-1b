class Order < ActiveRecord::Base
  validates :client, :description, :unit_price, :amount, :address, :supplier,
    presence: true
  validates :unit_price, :amount, numericality: true
end

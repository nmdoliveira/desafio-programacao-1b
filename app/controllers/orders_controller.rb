class OrdersController < ApplicationController
  helper_method :orders

  private

  def orders
    @orders ||= Order.all
  end
end

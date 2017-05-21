class OrderDecorator < Draper::Decorator
  delegate_all

  def unit_price
    h.number_to_currency object.unit_price / 100.0
  end
end

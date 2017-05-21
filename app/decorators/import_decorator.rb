class ImportDecorator < Draper::Decorator
  delegate_all
  decorates_association :orders

  def created_at
    object.created_at.strftime "%d/%m/%Y %H:%M"
  end

  def total
    h.number_to_currency object.total / 100.0
  end
end

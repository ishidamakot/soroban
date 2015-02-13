module ApplicationHelper
  def number_to_jpy(n, unit='')
    number_to_currency(n, unit: unit, precision: 0)
  end
end

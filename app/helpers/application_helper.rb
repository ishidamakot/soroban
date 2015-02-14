module ApplicationHelper
  def number_to_jpy(n, unit='')
    number_to_currency(n, unit: unit, precision: 0,
                       negative_format: '%u-%n')
  end
end

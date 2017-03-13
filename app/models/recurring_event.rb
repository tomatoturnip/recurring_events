class RecurringEvent < ApplicationRecord
  CALCULATED_DAY_OF_MONTH = 19

  def calculated_date
    CALCULATED_DAY_OF_MONTH
  end

  def delivery_date
    month = start_date.month
    day = calculated_date
    year = start_date.year
    adjust_if_weekend(Date.new(year, month, day))
  end

  private

  def adjust_if_weekend(delivery_date)
    if delivery_date.saturday?
      delivery_date + 2.days
    elsif delivery_date.sunday?
      delivery_date + 1.day
    else
      delivery_date
    end
  end
end

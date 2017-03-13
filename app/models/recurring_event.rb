class RecurringEvent < ApplicationRecord
  has_many :events

  BANK_HOLIDAYS = [
      Date.new(2017, 1, 2),   Date.new(2017, 1, 16),  Date.new(2017, 2, 20),  Date.new(2017, 5, 29),
      Date.new(2017, 7, 4),   Date.new(2017, 9, 4),   Date.new(2017, 10, 9),  Date.new(2017, 11, 11),
      Date.new(2017, 11, 23), Date.new(2017, 12, 25), Date.new(2018, 1, 1),   Date.new(2018, 1, 15),
      Date.new(2018, 2, 19),  Date.new(2018, 5, 28),  Date.new(2018, 7, 4),   Date.new(2018, 9, 3),
      Date.new(2018, 10, 8),  Date.new(2018, 11, 12), Date.new(2018, 11, 22), Date.new(2018, 12, 25)
  ]

  def calculated_date
    start_date
  end

  def delivery_date
    delivery = adjust_if_weekend(calculated_date)
    check_if_bank_holiday(delivery)
  end

  def next_four
    events.last(4)
  end

  private

  def adjust_if_weekend(delivery_date)
    if delivery_date.saturday?
      delivery_date - 1.day
    elsif delivery_date.sunday?
      delivery_date - 2.days
    else
      delivery_date
    end
  end

  def check_if_bank_holiday(delivery_date)
    if BANK_HOLIDAYS.include?(delivery_date)
      delivery = delivery_date - 1.day
      adjust_if_weekend(delivery)
    else
      delivery_date
    end
  end
end

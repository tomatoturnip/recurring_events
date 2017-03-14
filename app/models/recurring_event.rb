class RecurringEvent < ApplicationRecord
  has_many :events

  def calculated_date
    start_date
  end

  def delivery_date
    CalculateDeliveryDate.new(self.calculated_date).get_future_delivery_date
  end

  def next_four
    events.last(4)
  end
end

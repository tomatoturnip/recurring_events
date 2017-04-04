class NextEvent
  attr_accessor :event, :recurring_event

  def initialize(current_event, recurring_event)
    @event = current_event
    @recurring_event = recurring_event
  end

  def calculate_next_delivery
    recurring_time_interval = recurring_event.number_months
    next_date = event.delivery_date + recurring_time_interval.month
    CalculateDeliveryDate.new(next_date).get_future_delivery_date
  end
end
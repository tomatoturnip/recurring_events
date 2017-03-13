class NextEvent
  attr_accessor :event, :recurring_event

  def initialize(current_event, recurring_event)
    @event = current_event
    @recurring_event = recurring_event
  end

  def calculate_next_delivery
    number_of_months_between = recurring_event.number_months
    event.delivery_date + number_of_months_between.month
    # run constraint checks
  end
end
class Event < ApplicationRecord
  belongs_to :recurring_event

  def next_delivery_date
    next_date = NextEvent.new(self, RecurringEvent.find(self.recurring_event_id)).calculate_next_delivery
    event(next_delivery_date: next_date)
    event.save && schedule_background_job(event)
  end

  private

  def schedule_background_job(event)
    # perform job at specified time
  end
end
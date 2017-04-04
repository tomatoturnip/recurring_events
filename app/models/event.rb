class Event < ApplicationRecord
  belongs_to :recurring_event
  after_create :calculate_next_delivery_date

  def calculate_next_delivery_date
    next_date = NextEvent.new(self, RecurringEvent.find(self.recurring_event_id)).calculate_next_delivery
    self.next_delivery_date = next_date
    self.save && schedule_background_job(self)
  end

  private

  def schedule_background_job(event)
    NextEventCreationJob.set(wait: event.next_delivery_date).perform_later(event)
  end
end
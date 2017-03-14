class NextEventCreationJob < ApplicationJob
  queue_as :default

  def perform(event)
    puts "!!!!!!!!!!!!!!!!!!! MAKING A NEW EVENT !!!!!!!!!!!!!!!!"
    event = Event.new(delivery_date: event.next_delivery_date, recurring_event_id: event.recurring_event_id)
    event.save!
  end
end

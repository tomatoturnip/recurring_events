require "rails_helper"

describe Event do
  context "after an event is created, a job will run and create the next event" do
    let!(:recurring_event) { RecurringEvent.create(name: "plant watering", start_date: Date.new(2017, 3, 11), number_months: 1) }
    let!(:event) { Event.create(delivery_date: Date.new(2017, 3, 13), recurring_event: recurring_event) }

    it "generates a next delivery date" do
      expect(event.next_delivery_date).to eq(Date.new(2017, 4, 13))
    end
end
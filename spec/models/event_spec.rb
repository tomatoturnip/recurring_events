require "rails_helper"

RSpec.describe Event, type: :model do
  context "after an event is created, a job will run and create the next event" do
    it "generates a next delivery date" do
      event = Event.new(delivery_date: Date.new(2017, 3, 13))
      expect(event.next_delivery_date).to eq(2017, 4, 13)
    end
  end

end
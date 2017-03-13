require "rails_helper"

RSpec.describe RecurringEvent, type: :model do
  it "can create a recurring event" do
    recurring_event = RecurringEvent.create(name: "plant watering", start_date: Date.new(2017, 3, 11), number_months: 1)
    expect(recurring_event).to_not be_nil
  end

  it "has a calculated date based on the start date" do
    recurring_event = RecurringEvent.create(name: "plant watering", start_date: Date.new(2017, 3, 11), number_months: 1)
    calculated_date = recurring_event.calculated_date
    expect(calculated_date).to eq(Date.new(2017, 3, 11))
  end

  it "has a delivery date based on the calculated date" do
    recurring_event = RecurringEvent.create(name: "plant watering", start_date: Date.new(2017, 3, 19), number_months: 1)
    expect(recurring_event.delivery_date).to eq(Date.new(2017, 3, 17))
  end

  it "adjusts delivery date if the delivery date is on a bank holidays" do
    recurring_event = RecurringEvent.create(name: "plant watering", start_date: Date.new(2017, 1, 2), number_months: 1)
    expect(recurring_event.delivery_date).to eq(Date.new(2016, 12, 30))
  end
end

require "rails_helper"

describe CalculateDeliveryDate do
  it "calculates the right delivery date" do
    date = Date.new(2017, 3, 12)
    service = CalculateDeliveryDate.new(date)

    expect(service.get_future_delivery_date).to eq(Date.new(2017, 3, 10))
  end
end
class AddNextDeliveryDateToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :next_delivery_date, :date
  end
end

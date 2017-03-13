class CreateRecurringEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :recurring_events do |t|
      t.string :name
      t.date :start_date
      t.integer :number_months

      t.timestamps
    end
  end
end

class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.date :delivery_date
      t.references :recurring_event, foreign_key: true
    end
  end
end

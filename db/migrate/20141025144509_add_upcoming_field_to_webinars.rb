class AddUpcomingFieldToWebinars < ActiveRecord::Migration
  def change
    change_table :webinars do |t|
      t.boolean :upcoming, default: false
      t.datetime :planned_date
    end
  end
end

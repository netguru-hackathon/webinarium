class AddNotifiedFieldToWebinar < ActiveRecord::Migration
  def change
    change_table :webinars do |t|
      t.boolean :reminded, default: false
    end
  end
end

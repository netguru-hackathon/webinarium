class AddDescriptionToWebinars < ActiveRecord::Migration
  def change
    change_table :webinars do |t|
      t.text :description
    end
  end
end

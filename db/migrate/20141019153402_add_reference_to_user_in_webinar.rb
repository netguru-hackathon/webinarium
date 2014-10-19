class AddReferenceToUserInWebinar < ActiveRecord::Migration
  def change
    change_table :webinars do |t|
      t.references :user, index: true
    end
  end
end

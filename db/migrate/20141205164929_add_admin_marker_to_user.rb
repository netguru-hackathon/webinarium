class AddAdminMarkerToUser < ActiveRecord::Migration
  def change
    def change
    change_table :users do |t|
      t.boolean :admin, default: false
    end
  end
  end
end

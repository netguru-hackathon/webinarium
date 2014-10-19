class AddUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :remote_uid
      t.string :email
      t.string :name
      t.string :nickname
      t.string :image_url
    end
  end
end

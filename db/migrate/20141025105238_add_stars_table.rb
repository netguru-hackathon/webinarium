class AddStarsTable < ActiveRecord::Migration
  def up
    create_table :stars do |t|
      t.references :webinar, index: true
      t.references :user, index: true
    end
  end

  def down
    drop_table :stars
  end
end

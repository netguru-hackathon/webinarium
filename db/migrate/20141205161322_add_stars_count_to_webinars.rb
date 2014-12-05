class AddStarsCountToWebinars < ActiveRecord::Migration
  def up
    add_column :webinars, :stars_count, :integer, null: false, default: 0

    execute "update webinars set stars_count = (select count(*) from stars where webinar_id = webinars.id)"
  end

  def down
    remove_column :webinars, :stars_count
  end
end

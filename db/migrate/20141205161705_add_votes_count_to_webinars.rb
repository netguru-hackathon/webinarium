class AddVotesCountToWebinars < ActiveRecord::Migration
  def up
    add_column :webinars, :votes_count, :integer, null: false, default: 0

    execute "update webinars set votes_count = (select count(*) from votes where webinar_id = webinars.id)"
  end

  def down
    remove_column :webinars, :votes_count
  end
end

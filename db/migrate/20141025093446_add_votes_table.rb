class AddVotesTable < ActiveRecord::Migration
  def up
    create_table :votes do |t|
      t.references :webinar, index: true
      t.references :user, index: true
    end
  end

  def down
    drop_table :votes
  end
end

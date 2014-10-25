class AddSuggestionVotesTable < ActiveRecord::Migration
  def up
    create_table :suggestion_votes do |t|
      t.references :suggestion, index: true
      t.references :user, index: true
    end
  end

  def down
    drop_table :suggestion_votes
  end
end

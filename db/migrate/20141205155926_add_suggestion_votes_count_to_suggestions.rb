class AddSuggestionVotesCountToSuggestions < ActiveRecord::Migration
  def up
    add_column :suggestions, :suggestion_votes_count, :integer, null: false, default: 0

    execute "update suggestions set suggestion_votes_count = (select count(*) from suggestion_votes where suggestion_id = suggestions.id)"
  end

  def down
    remove_column :suggestions, :suggestion_votes_count
  end
end

class SuggestionVote < ActiveRecord::Base

  belongs_to :suggestion
  belongs_to :user

  validates :suggestion_id, :user_id, presence: true
  validates :user_id, uniqueness: { scope: :suggestion_id }

end

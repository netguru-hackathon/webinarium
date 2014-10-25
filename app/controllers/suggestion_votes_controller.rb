class SuggestionVotesController < ApplicationController
  expose(:suggestion) { Suggestion.find(suggestion_params[:suggestion_id]) }
  expose(:suggestion_vote)

  def create
    vote.user_id = current_user.id
    vote.suggestion_id = suggestion.id
    if suggestion_vote.save
      redirect_to suggestions_path
    else
      redirect_to suggestions_path, error: I18n.t('controllers.suggestion_votes.create.error')
    end
  end

  private

  def suggestion_params
    params.permit(:suggestion_id)
  end

end

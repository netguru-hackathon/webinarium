class SuggestionDecorator < Draper::Decorator
  include Draper::LazyHelpers

  delegate :description, :id

  def vote_count
    object.suggestion_votes.count
  end

  def voted?(user)
    object.suggestion_votes.pluck(:user_id).include? user.id
  end

  def upvote_link(user)
    unless voted?(user)
      link_to I18n.t('suggestions.suggestion.vote'), suggestion_suggestion_votes_path(suggestion_id: object.id),
        method: :post, class: 'btn btn-info btn-sg-up'
    end
  end


end

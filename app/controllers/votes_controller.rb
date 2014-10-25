class VotesController < ApplicationController
  expose(:webinar) { Webinar.find(webinar_params[:webinar_id]) }
  expose(:vote)

  def create
    vote.user_id = current_user.id
    vote.webinar_id = webinar.id
    if vote.save
      redirect_to webinars_path
    else
      redirect_to webinars_path, error: I18n.t('controllers.votes.create.error')
    end
  end

  def destroy
    vote.destroy
    if vote.destroyed?
      redirect_to webinars_path
    else
      redirect_to webinars_path, error: I18n.t('controllers.votes.destroy.error')
    end
  end

  private

  def webinar_params
    params.permit(:webinar_id)
  end

end

class StarsController < ApplicationController
  expose(:webinar) { Webinar.find(webinar_params[:webinar_id]) }
  expose(:star)

  def create
    star.user_id = current_user.id
    star.webinar_id = webinar.id
    if star.save
      redirect_to webinars_path
    else
      redirect_to webinars_path, error: I18n.t('controllers.star.create.error')
    end
  end

  def destroy
    star.destroy
    if star.destroyed?
      redirect_to webinars_path
    else
      redirect_to webinars_path, error: I18n.t('controllers.star.destroy.error')
    end
  end

  private

  def webinar_params
    params.permit(:webinar_id)
  end

end

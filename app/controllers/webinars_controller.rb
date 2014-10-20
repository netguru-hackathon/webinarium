class WebinarsController < ApplicationController
  expose(:webinars) { Webinar.latest }
  expose(:webinar, attributes: :webinar_params)

  def index
  end

  def new
  end

  def create
    if webinar.save
      redirect_to webinars_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if webinar.save
      redirect_to webinars_path
    else
      render :edit
    end
  end

  private

  def webinar_params
    params.require(:webinar).permit(
      :title,
      :youtube_url,
      :description,
      :language,
      :translation_available,
      :blogpost_url,
      :doc_url,
      :code_url
    )
  end

end

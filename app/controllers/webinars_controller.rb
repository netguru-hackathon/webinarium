class WebinarsController < ApplicationController
  expose(:webinars) { Webinar.latest }

  def index
  end

end

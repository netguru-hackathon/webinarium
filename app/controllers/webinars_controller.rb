class WebinarsController < ApplicationController
  expose(:webinars) { Webinar.latest }
  expose(:webinar)

  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

end

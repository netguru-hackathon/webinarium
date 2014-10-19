class SessionsController < ApplicationController

  skip_before_filter :authentication_check

  respond_to :json, only: [:destroy]

  expose(:failure_message) { params[:message].presence || 'unknown' }
  expose(:github_auth_path) { '/auth/github' }

  def index
  end

  def create
    user = Authentication::UserBuilder.new(auth_hash).find_or_build
    if user.persisted? || user.save
      sign_in user
      redirect_to root_path
    else
      render text: "Couldn't log you in!"
    end
  end

  def destroy
    sign_out
    respond_with nil, location: auth_url
  end

  def failure
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end

class ApplicationController < ActionController::Base
  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  protect_from_forgery with: :exception

  helper_method :current_user, :authenticated?, :sign_in, :sign_out

  before_filter :authentication_check

  expose(:current_user) { get_current_user }

  private

  def get_current_user
    User.find(session[:user_id]) if session[:user_id].present?
  end

  def authenticated?
    current_user.present?
  end

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session[:user_id] = nil
  end

  def authentication_check
    redirect_to auth_path unless authenticated?
  end
end

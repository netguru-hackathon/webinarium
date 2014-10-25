class UsersController < ApplicationController
  expose_decorated(:user)

  def show
    if user.id != current_user.id
      redirect_to webinars_path, alert: 'nuh uh'
    end
  end

end

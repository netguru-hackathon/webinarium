class UsersController < ApplicationController
  expose(:user)

  def show
    if user.id != current_user.id
      redirect_to webinars_path, alert: 'nuh uh'
    end
  end

end

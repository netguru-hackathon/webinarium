class SuggestionsController < ApplicationController
  expose_decorated(:suggestions) { Suggestion.latest }
  expose(:suggestion, attributes: :suggestion_params)

  def index
  end

  def new
  end

  def create
    suggestion.user_id = current_user.id
    if suggestion.save
      redirect_to suggestions_path
    else
      render :new
    end
  end

  def destroy
  end


  private

  def suggestion_params
    params.require(:suggestion).permit(:description)
  end

end

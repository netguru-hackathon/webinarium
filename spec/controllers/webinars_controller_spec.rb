require 'rails_helper'

describe WebinarsController, type: :controller do
  describe '#index' do
    context 'for not logged in user' do
      it 'redirects to login page' do
        get :index
        expect(response).to redirect_to(auth_path)
      end
    end
  end
end

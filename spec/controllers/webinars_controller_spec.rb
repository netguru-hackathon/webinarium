require 'rails_helper'

describe WebinarsController, type: :controller do
  describe '#index' do
    it 'responds with 200' do
      get :index
      expect(response.status).to eq 200
    end
  end
end

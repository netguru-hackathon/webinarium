require 'rails_helper'

describe Webinar do
  let(:webinar) { create :webinar }
  describe '#thumbnail' do
    it 'returns thumbnail url' do
      expect(webinar.thumbnail).to eq 'http://i1.ytimg.com/vi/dummyid/hqdefault.jpg'
    end
  end
end

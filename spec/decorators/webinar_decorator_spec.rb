require 'rails_helper'

describe WebinarDecorator do

  subject { webinar.decorate }
  let(:webinar) { create :webinar }

  describe '#thumbnail' do
    it 'returns thumbnail url' do
      expect(subject.thumbnail).to eq 'http://i1.ytimg.com/vi/dummyid/hqdefault.jpg'
    end
  end

end

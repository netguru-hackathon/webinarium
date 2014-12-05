require 'rails_helper'

describe WebinarDecorator do

  subject { webinar.decorate }
  let(:user) { create :user }
  let(:other_user) { create :user }
  let(:webinar) { create :webinar, user_id: user.id }

  describe '#thumbnail' do
    it 'returns thumbnail url' do
      expect(subject.thumbnail).to eq 'http://i1.ytimg.com/vi/dummyid/hqdefault.jpg'
    end
  end
end

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

  describe '#vote_count' do

    let!(:vote1) { create :vote, user_id: user.id, webinar_id: webinar.id }
    let!(:vote2) { create :vote, user_id: other_user.id, webinar_id: webinar.id }

    it 'returns number of people who voted on this webinar' do
      expect(subject.vote_count).to eq 2
    end
  end

  describe '#voted?' do
    context 'when user voted on this webinar' do
      let!(:vote) { create :vote, user_id: user.id, webinar_id: webinar.id }

      it 'returns true' do
        expect(subject.voted?(user)).to eq true
      end
    end

    context 'when user did not vote on this webinar' do
      let!(:vote) { create :vote, user_id: other_user.id, webinar_id: webinar.id }

      it 'returns true' do
        expect(subject.voted?(user)).to eq false
      end
    end
  end

end

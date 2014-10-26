require 'rails_helper'

describe Webinar do

  it { should respond_to(:id) }
  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:language) }
  it { should respond_to(:translation_available) }
  it { should respond_to(:youtube_url) }
  it { should respond_to(:blogpost_url) }
  it { should respond_to(:doc_url) }
  it { should respond_to(:code_url) }

  let(:user) { create :user }

  describe 'validation' do
    context 'for upcoming webinar' do
      let(:webinar) { build :webinar, user_id: user.id, upcoming: true, youtube_url: nil, planned_date: nil }

      it 'validates presence of the planned air date' do
        expect(webinar.valid?).to eq false
        expect(webinar.errors.messages[:planned_date]).to eq ["can't be blank"]
        expect(webinar.errors.messages[:youtube_url]).to be_nil
      end
    end

    context 'for already aired webinar' do
      let(:webinar) { build :webinar, user_id: user.id, upcoming: false, youtube_url: nil, language: nil }

      it 'validates presence of youtube url and language' do
        expect(webinar.valid?).to eq false
        expect(webinar.errors.messages[:planned_date]).to be_nil
        expect(webinar.errors.messages[:youtube_url]).to eq ["can't be blank"]
        expect(webinar.errors.messages[:language]).to eq ["can't be blank", "must be PL or EN"]
      end
    end

    context 'for non-youtube link' do
      let(:webinar) { build :webinar, user_id: user.id, youtube_url: "http://example.com" }

      it 'returns false' do
        expect(webinar.valid?).to eq false
        expect(webinar.errors.messages[:youtube_url]).to eq ["please paste a full youtube url"]
      end
    end

    context 'for youtube link' do
      let(:webinar) { build :webinar, user_id: user.id, youtube_url: "http://www.youtube.com/watch?v=babblah" }

      it 'returns true' do
        expect(webinar.valid?).to eq true
        expect(webinar.errors.messages[:youtube_url]).to be_nil
      end
    end
  end

end

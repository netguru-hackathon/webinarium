class Webinar

  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :youtube_url, type: String
  field :blogpost_url, type: String
  field :doc_url, type: String
  field :code_url, type: String
  field :language, type: String
  field :translation_available, type: Mongoid::Boolean

  validates :youtube_url, :language, presence: true
  validate :language_option_is_valid

  scope :latest, -> { order_by(created_at: 'desc') }

  def thumbnail
    "http://i1.ytimg.com/vi/#{youtube_video_id}/hqdefault.jpg" if youtube_video_id.present?
  end

  private

  def youtube_video_id
    uri = URI.parse(youtube_url)
    params = CGI.parse(uri.query)
    video_id = params.fetch("v", nil)
    video_id[0] if video_id.present?
  end

  def language_option_is_valid
    unless ['PL', 'EN'].include? self.language.to_s.upcase
      self.errors.add(:language, 'must be PL or EN')
    end
  end

end

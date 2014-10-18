class Webinar

  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :youtube_url, type: String
  field :blogpost_url, type: String
  field :doc_url, type: String
  field :language, type: String
  field :translation_available, type: Mongoid::Boolean

  validate :youtube_url, presence: true

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

end

class WebinarDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate :youtube_url, :language, :blogpost_url, :doc_url, :code_url, :translation_available, :user, :title, :description

  def thumbnail
    vid = youtube_video_id
    "http://i1.ytimg.com/vi/#{vid}/hqdefault.jpg" if vid.present?
  end

  private

  def youtube_video_id
    uri = URI.parse(object.youtube_url)
    params = CGI.parse(uri.query)
    video_id = params.fetch("v", nil)
    video_id[0] if video_id.present?
  end

end

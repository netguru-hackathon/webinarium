class Webinar

  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :youtube_url, type: String
  field :blogpost_url, type: String
  field :doc_url, type: String
  field :language, type: String
  field :translation_available, type: Mongoid::Boolean

end

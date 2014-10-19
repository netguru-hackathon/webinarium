class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :provider, type: String
  field :remote_uid, type: String
  field :email, type: String
  field :name, type: String
  field :nickname, type: String
  field :image_url, type: String

end

class User < ActiveRecord::Base

  has_many :webinars
  has_many :votes

end

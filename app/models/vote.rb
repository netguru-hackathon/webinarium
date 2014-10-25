class Vote < ActiveRecord::Base

  belongs_to :webinar
  belongs_to :user

end

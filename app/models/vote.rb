class Vote < ActiveRecord::Base

  belongs_to :webinar
  belongs_to :user

  validates :webinar_id, :user_id, presence: true
  validates :user_id, uniqueness: { scope: :webinar_id }

end

class Star < ActiveRecord::Base

  belongs_to :webinar, counter_cache: true
  belongs_to :user

  validates :webinar_id, :user_id, presence: true
  validates :user_id, uniqueness: { scope: :webinar_id }

end

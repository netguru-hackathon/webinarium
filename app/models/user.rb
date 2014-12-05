class User < ActiveRecord::Base

  has_many :webinars
  has_many :votes
  has_many :stars
  has_many :suggestions
  has_many :suggestion_votes

  def star_id_for(webinar_id)
    stars.find{ |s| s.webinar_id == webinar_id }.try(:id)
  end

  def vote_id_for(webinar_id)
    votes.find{ |v| v.webinar_id == webinar_id }.try(:id)
  end
end

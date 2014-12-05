class WebinarDecorator < Draper::Decorator
  include Draper::LazyHelpers

  delegate :youtube_url, :language, :blogpost_url, :doc_url, :code_url, :translation_available,
    :user, :title, :description, :id, :planned_date

  def thumbnail
    return if object.upcoming?
    vid = youtube_video_id
    "http://i1.ytimg.com/vi/#{vid}/hqdefault.jpg" if vid.present?
  end

  def vote_count
    object.votes_count
  end

  def star_count
    object.stars_count
  end

  def voted?(user)
    object.votes.where(user_id: user_id).exists?
  end

  def starred?(user)
    object.stars.where(user_id: user_id).exists?
  end

  def like_link(user)
    if voted?(user)
      link_to I18n.t('webinars.webinar.unvote'), webinar_vote_path(webinar_id: object.id, id: user_vote(user).id),
        method: :delete, class: 'btn btn-default'
    else
      link_to I18n.t('webinars.webinar.vote'), webinar_votes_path(webinar_id: webinar.id),
        method: :post, class: 'btn btn-info'
    end
  end

  def star_link(user)
    if starred?(user)
      link_to webinar_star_path(webinar_id: object.id, id: user_star(user).id), method: :delete, class: 'btn btn-default' do
        content_tag(:span, nil, class: 'glyphicon glyphicon-star')
      end
    else
      link_to webinar_stars_path(webinar_id: webinar.id), method: :post, class: 'btn btn-info' do
        content_tag(:span, nil, class: 'glyphicon glyphicon-star-empty')
      end
    end
  end

  def youtube_video_id
    uri = URI.parse(object.youtube_url)
    params = CGI.parse(uri.query)
    video_id = params.fetch("v", nil)
    video_id[0] if video_id.present?
  end

  private

  def user_vote(user)
    object.votes.find_by(user_id: user.id)
  end

  def user_star(user)
    object.stars.find_by(user_id: user.id)
  end
end

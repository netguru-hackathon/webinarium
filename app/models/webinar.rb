class Webinar < ActiveRecord::Base

  belongs_to :user
  has_many :votes
  has_many :stars

  validates :user_id, :title, :description, :planned_date, presence: true
  validates :youtube_url, :language, presence: true, if: :webinar_aired?
  validate :language_option_is_valid, if: :webinar_aired?

  scope :latest, -> { order(created_at: :desc) }
  scope :upcoming, -> { where(upcoming: true).where('planned_date > ?', Time.current).order(planned_date: :asc) }
  scope :aired, -> { where(upcoming: [false, nil]) }

  def webinar_aired?
    !self.upcoming
  end

  def upcoming?
    self.upcoming
  end

  private

  def language_option_is_valid
    unless ['PL', 'EN'].include? self.language.to_s.upcase
      self.errors.add(:language, 'must be PL or EN')
    end
  end

end

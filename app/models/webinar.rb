class Webinar < ActiveRecord::Base

  belongs_to :user
  has_many :votes

  validates :title, :description, :youtube_url, :language, presence: true
  validate :language_option_is_valid

  scope :latest, -> { order(created_at: :desc) }

  private

  def language_option_is_valid
    unless ['PL', 'EN'].include? self.language.to_s.upcase
      self.errors.add(:language, 'must be PL or EN')
    end
  end

end

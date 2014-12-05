module Services
  class ScheduleChecker

    def self.send_notifs_for_near_webinars
      near_webinars = Webinar.where(reminded: [false, nil], planned_date: Time.now...30.minutes.from_now)
      return unless near_webinars.any?
      near_webinars.each do |webinar|
        how_long_from_now = (webinar.planned_date - Time.now) / 60
        msg = "Webinar '#{webinar.title}' will go on air in #{how_long_from_now} minutes"
        Services::SlackNotifier.new(msg).call
        webinar.mark_as_reminded!
      end
    end

  end
end

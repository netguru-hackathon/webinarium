module Services
  class SlackNotifier

    attr_reader :notification, :options

    def initialize(notification, options={})
      @notification = notification
      @options = options
    end

    def call
      notify
    end

    private

    def notify
      channel.ping notification.to_s
    end

    def channel
      @channel ||= ::Slack::Notifier.new AppConfig.slack.webhook_url,
        channel: AppConfig.slack.default_channel,
        username: 'WebinariumApp',
        color: '#0092ca'
    end
  end
end

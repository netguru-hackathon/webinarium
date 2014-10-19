require File.expand_path('../boot', __FILE__)

require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
require File.expand_path('../preinitializer', __FILE__)

Bundler.require(*Rails.groups)

module Webinarium
  class Application < Rails::Application

  end
end

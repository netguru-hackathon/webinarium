require File.expand_path('../boot', __FILE__)

require 'rails/all'
require File.expand_path('../preinitializer', __FILE__)

Bundler.require(*Rails.groups)

module Webinarium
  class Application < Rails::Application
    config.autoload_paths += Dir[Rails.root.join('app', 'services', '{**/}')]

  end
end

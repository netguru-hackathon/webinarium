ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'simplecov'

SimpleCov.profiles.define 'rails_no_vendor' do
  load_profile 'rails'
  add_filter 'vendor' # Don't include vendored stuff
end
SimpleCov.start 'rails_no_vendor'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
  config.infer_spec_type_from_file_location!
end

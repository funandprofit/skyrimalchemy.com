ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'database_cleaner'

require File.expand_path(File.dirname(__FILE__) + "/blueprints_helper")

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.fail_fast = true
  config.mock_with :rspec

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:all) do
    Sham.reset(:before_all)
  end

  config.before(:each) do
    Sham.reset(:before_each)
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

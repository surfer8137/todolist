# spec/spec_helper.rb
require 'rack/test'
require 'rspec'
require 'capybara/dsl'
require 'database_cleaner'
require './app'

ENV['RACK_ENV'] = 'test'

RSpec.configure do |config|
  config.include Capybara
  config.before do
    DatabaseCleaner.start
  end
  config.after do
    DatabaseCleaner.clean
  end
end

Capybara.app = Sinatra::Application

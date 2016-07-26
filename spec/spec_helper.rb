require 'rack/test'
require 'rspec'
require 'capybara/dsl'
require 'database_cleaner'

ENV['RACK_ENV'] = 'test'
require './config/boot'
require './app'

RSpec.configure do |config|
  config.include Capybara::DSL
  config.before do
    DatabaseCleaner.start
  end
  config.after do
    DatabaseCleaner.clean
  end
end

Capybara.app = ToDoListApp

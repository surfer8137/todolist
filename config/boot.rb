$LOAD_PATH << File.join(File.dirname(__FILE__), '../app')
ENV['RACK_ENV'] ||= 'development'

require './config/initializers/database'

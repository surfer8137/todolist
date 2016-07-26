require 'active_record'

if ENV['RACK_ENV'] == 'production'
  ActiveRecord::Base.establish_connection(
    ENV['DATABASE_URL']
  )
else
  require 'flyml'
  config = Flyml.config(root: File.join(File.dirname(__FILE__),'../..'), env: ENV['RACK_ENV']) 
  ActiveRecord::Base.establish_connection(
    adapter: config[:database][:adapter],
    database: config[:database][:name]
  )
end

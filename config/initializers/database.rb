require './config/environments'
require 'flyml'

config = Flyml.config(root: File.join(File.dirname(__FILE__),'./'), env: ENV['env'])

db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')

ActiveRecord::Base.establish_connection(
  adapter: config[:database][:adapter],
  database: config[:database][:name]
)

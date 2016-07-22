require 'sinatra'
require 'active_record'
require 'sinatra/activerecord'
require './config/environments'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database =>  'development.db'
)
 


get '/' do
  @important_tasks = ImportantTask.all
  @tasks = Task.all
  erb :today_tasks
end

get '/add-task' do
  erb :add_task
end

get '/add-important-task' do
  erb :add_important_task
end

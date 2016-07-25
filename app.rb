$LOAD_PATH << File.join(File.dirname(__FILE__), 'app')
require 'sinatra'
require './config/environments'
require 'model/task'

get '/' do
  @tasks = Task.all
  erb :today_tasks
end

get '/add-task' do
  erb :add_task
end

post '/add-task' do
  task = Task.new do |task_to_add|
    task_to_add.title = params[:name]
    task_to_add.body = params[:comment]
    task_to_add.finish_time = params[:date]
    task_to_add.important = params[:important]
    task_to_add.finished = false
    task_to_add.save
  end
  redirect '/'
end

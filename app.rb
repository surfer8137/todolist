$LOAD_PATH << File.join(File.dirname(__FILE__), 'app')
require 'sinatra'
require './config/environments'
require 'model/task'
require 'date'

class ToDoListApp < Sinatra::Base
  get '/' do
    redirect '/0'
  end

  get %r{/([-]*[\d]+)} do
    date =  Date.today
    days_to_sum = params[:captures].join.to_i
    date = date + days_to_sum

    more_important_tasks = Task.where(important: true, finish_time: date)
    less_important_tasks = Task.where(important: false, finish_time: date)

    next_day = days_to_sum + 1
    previous_day = days_to_sum - 1

    erb :today_tasks, :locals => {
      important_tasks: more_important_tasks,
      tasks: less_important_tasks,
      day: date.day,
      month: date.mon,
      year: date.year,
      next_day: next_day,
      previous_day: previous_day
    }

  end

  get '/add-task' do
    erb :add_task
  end

  post '/add-task' do
    task = Task.new do |task_to_add|
      task_to_add.title = params[:name]
      task_to_add.body = params[:comment]
      task_to_add.finish_time = params[:date] || Date.today
      task_to_add.important = params[:important] || false
      task_to_add.finished = false
      task_to_add.save
    end
    redirect '/'
  end
end

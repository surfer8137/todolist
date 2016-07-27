require 'sinatra'
require 'model/task'
require 'date'

class ToDoListApp < Sinatra::Base
  get '/' do
    redirect '/todo'
  end

  get '/done' do
    tasks = Task.where(finished: true).sort_by &:finish_time

    erb :done_tasks, :locals => {
      tasks: tasks
    }
  end

  get '/todo' do
    date =  Date.today

    more_important_tasks = Task.where(important: true, finished: false).sort_by &:finish_time
    less_important_tasks = Task.where(important: false, finished: false ).sort_by &:finish_time

    erb :todo_tasks, :locals => {
      important_tasks: more_important_tasks,
      tasks: less_important_tasks
    }
  end

  get %r{/([\d]+)} do

  end

  get '/add-task' do
    erb :add_task, :locals => {
      date: Date.today.to_s
    }
  end

  post '/add-task' do
    create_task
    redirect '/'
  end

  def create_task
    task = Task.new(
      title: params[:name],
      body: params[:comment],
      finish_time: params[:date],
      important: important,
      finished: false
    )
    task.save
  end

  def important
    params[:important] || false
  end
end


#get %r{/([-]*[\d]+)} do
#  date =  Date.today
#  days_to_sum = params[:captures].join.to_i
#  date = date + days_to_sum
#
#  more_important_tasks = Task.where(important: true, finish_time: date)
#  less_important_tasks = Task.where(important: false, finish_time: date)
#
#  next_day = days_to_sum + 1
#  previous_day = days_to_sum - 1
#
#  erb :today_tasks, :locals => {
#    important_tasks: more_important_tasks,
#    tasks: less_important_tasks,
#    day: date.day,
#    month: date.mon,
#    year: date.year,
#    next_day: next_day,
#    previous_day: previous_day
#  }
#end

require 'sinatra'
require 'model/task'
require './app/model/title_parser'
require 'date'

class ToDoListApp < Sinatra::Base
  get '/' do
    redirect '/todo'
  end

  get '/done' do
    tasks = Task.find_with(finished: true).order(finish_time: :desc)

    erb :done_tasks, locals: {
      tasks: tasks
    }
  end

  get '/todo' do
    more_important_tasks = Task.find_with(important: true, finished: false).order(finish_time: :desc)
    less_important_tasks = Task.find_with(important: false, finished: false).order(finish_time: :desc)

    erb :todo_tasks, locals: {
      important_tasks: more_important_tasks,
      tasks: less_important_tasks,
      day: today
    }
  end

  # Access to a task throught its own url -> task_name-id
  get %r{/(([\w])*)-([\d]+)} do
    id = params[:captures].last
    task = Task.find_with(id: id).take
    erb :show_task, locals: {
      task: task
    }
  end

  post %r{/(([\w])*)-([\d]+)} do
    id = params[:captures].last
    params[:finished] ||= false
    params[:important] ||= false
    task = Task.find_with(id: id).update_attributes(
      title: params[:title],
      body: params[:body],
      finish_time: params[:finish_time],
      finished: params[:finished],
      important: params[:important]
    )
    redirect '/'
  end

  get '/add-task' do
    erb :add_task, locals: {
      date: Date.today.to_s
    }
  end

  post '/add-task' do
    Task.create_with(params)
    redirect '/'
  end

  def today
    Date.today
  end
end

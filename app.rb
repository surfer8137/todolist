require 'sinatra'
require 'model/task'
require './lib/title_parser'
require './lib/csv_maker'
require './lib/csv_deleter'
require './lib/csv_vars'
require 'date'

class ToDoListApp < Sinatra::Base
  get '/' do
    redirect '/todo'
  end

  get '/done' do
    tasks = Task.done

    erb :done_tasks, locals: {
      tasks: tasks
    }
  end

  get '/todo' do
    more_important_tasks = Task.pending.select {|a| a.important}
    less_important_tasks = Task.pending.select {|a| !a.important}

    erb :todo_tasks, locals: {
      important_tasks: more_important_tasks,
      tasks: less_important_tasks,
      day: today
    }
  end

  # Access to a task throught its own url -> task_name-id
  get %r{(\w*-\w*)*-([\d]+)} do
    id = params[:captures].last
    task = Task.find_by(id: id)
    erb :show_task, locals: {
      task: task
    }
  end

  post %r{(\w*-\w*)*-([\d]+)} do
    id = params[:captures].last
    params[:finished] ||= false
    params[:important] ||= false
    task = Task.find_by(id: id).update(
      title: params[:title],
      description: params[:description],
      finish_time: params[:finish_time],
      finished: params[:finished],
      important: params[:important]
    )
    redirect '/'
  end

  get '/finish/:id' do
    Task.finish(params[:id])
    redirect '/done'
  end

  get '/add-task' do
    erb :add_task, locals: {
      date: today
    }
  end

  post '/add-task' do
    Task.create_with(params)
    redirect '/'
  end

  get '/download-csv' do
    download_csv
  end

  private

  def download_csv
    CSVMaker.make
    send_file(CSVVars::DEFAULT_PATH, :filename => CSVVars::DEFAULT_NAME, :type => 'Application/octet-stream')
    CSVMaker.destroy
  end

  def today
    Date.today
  end
end

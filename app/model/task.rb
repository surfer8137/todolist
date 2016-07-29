require 'active_record'

class Task < ActiveRecord::Base
  class << self
    def create_with(args)
      task = Task.new(
        title: args[:title],
        description: args[:description],
        finish_time: args[:finish_time],
        important: args[:important]
      )
      task.save
      task
    end

    def pending
      where(finished: false).order(finish_time: :desc)
    end

    def done
      where(finished: true).order(finish_time: :desc)
    end

    def finish(id)
      task = find_by(id: id)
      task.update(finished: true, finished_at: Date.today)
    end
  end
end

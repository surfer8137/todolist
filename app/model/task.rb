require 'active_record'

class Task < ActiveRecord::Base
  class << self
    def create_with(args)
      task = Task.new(
        title: title(args[:title]),
        description: args[:description],
        finish_time: date(args[:finish_time]),
        important: important(args[:important]),
        finished: false
      )
      task.save
    end

    def pending
      where(finished: false).order(finish_time: :desc)
    end

    def done
      where(finished: true).order(finish_time: :desc)
    end

    def finish(id)
      task = find_by(id: id)
      task.update(finished: true)
    end

    private

    def title(title)
      title || %{Task}
    end

    def date(date)
      date || Date.today
    end

    def important(important)
      important || false
    end
  end
end

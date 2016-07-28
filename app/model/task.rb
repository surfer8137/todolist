require 'active_record'

class Task < ActiveRecord::Base
  class << self
    def find_with(args)
      where(args)
    end

    def update_attributes(attributes)
      update(attributes)
    end
    
    def create_with(args)
      task = Task.new(
        title: title(args[:name]),
        body: args[:comment],
        finish_time: date(args[:date]),
        important: important(args[:important]),
        finished: false
      )
      task.save
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

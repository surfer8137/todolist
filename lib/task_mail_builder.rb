class TaskMailBuilder
  HEADER = 'These are the tasks that finish today:'
  TO = 'angel.sanchez@peertransfer.com'
  FROM = 'ToDoListApp-Ruby@no-reply.com'
  SUBJECT = 'Remaining tasks'

  class << self
    def build
      tasks = HEADER
      Task.pending.each { |task| tasks += "\n-#{task.title}" if task.finish_time == Date.today}

      AppFramework::Email.new(
        to: TO,
        from: FROM,
        subject: SUBJECT,
        body: tasks
      )
    end
  end
end

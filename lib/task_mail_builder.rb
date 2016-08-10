class TaskMailBuilder
  class << self
    def build
      tasks = 'These are the tasks that finish today:'
      Task.pending.each { |task| tasks += "\n-#{task.title}"}

      AppFramework::Email.new(
        to: 'angel.sanchez@peertransfer.com',
        from: 'ToDoListApp-Ruby@no-reply.com',
        subject: 'Remaining tasks',
        body: tasks
      )
    end
  end
end

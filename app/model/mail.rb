require 'pony'

class Mailer
  MAIL_TO = 'angel.sanchez@peertransfer.com'
  MAIL_FROM = 'tasklistapp@no-reply.com'
  MAIL_SUBJECT = 'These tasks are going to end today!'
  class << self
    def setup
      Thread.new do
        day = Date.today
        day_to_send_mail = Date.today
        while true do
          if day == day_to_send_mail
            puts 'Sending some mails!'
            day_to_send_mail = day + 1
            send_mails
          else
            day = Date.today
          end
          sleep 60
        end
      end
    end

    private

    def tasks_to_send
      Task.where(finish_time: Date.today)
    end

    def send_mails
      tasks = tasks_to_send
      mail_text = 'The following tasks will end today: ' << "\n"
      tasks.each do |task|
        mail_text << ' -' << task.title << "\n"
      end

      mail_text << "\nPlease go to check your tasks here: https://todolistapp-ruby.herokuapp.com/"

      Pony.mail(
                to: MAIL_TO,
                from: MAIL_FROM,
                subject: MAIL_SUBJECT,
                body: mail_text
      )
    end
  end
end

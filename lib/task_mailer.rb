class TaskMailer
  class << self
    def send_mails
      mail = TaskMailBuilder.build
      AppFramework::MailSender.send(mail)
    end
  end
end

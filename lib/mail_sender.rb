require 'pony'

module AppFramework
  class MailSender
    def initialize(mail)
      @mail = mail
    end

    def send
      Pony.mail(@mail.fields)
      'sent successfully!'
    end
  end
end

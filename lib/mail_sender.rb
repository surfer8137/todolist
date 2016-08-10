require 'pony'

module AppFramework
  class MailSender
    class << self
      def send(mail)
        Pony.mail(mail.fields)
        'sent successfully!'
      end
    end
  end
end

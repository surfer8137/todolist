require 'spec_helper'

describe 'MailSender' do
  context 'Given an email' do
    it 'sends that email' do
      mail = AppFramework::Email.new(to: 'angel.sanchez@peertrasnfer.com', from: 'me', subject: 'none', body: 'some content')
      mail_sender = AppFramework::MailSender.new(mail)

      expect(mail_sender.send).to eq('sent successfully!')
    end
  end
end

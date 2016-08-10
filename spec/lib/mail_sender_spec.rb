require 'spec_helper'

describe 'MailSender' do
  context 'Given an email' do
    xit 'sends that email' do
      mail = AppFramework::Email.new(to: 'angel.sanchez@peertrasnfer.com', from: 'me', subject: 'none', body: 'some content')
      output = AppFramework::MailSender.send(mail)

      expect(output).to eq('sent successfully!')
    end
  end
end

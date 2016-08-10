require 'spec_helper'

describe 'Mail' do
  context 'given email fields' do
    it 'is prepared to be sent' do
      to = 'email'
      from = 'me'
      subject = 'none'
      body = 'some content'

      mail = AppFramework::Email.new(to: to, from: from, subject: subject, body: body)
      fields = mail.fields

      expect(fields).to eq({to: 'email', from: 'me', subject: 'none', body: 'some content'})
    end
  end
  context 'given an email' do
    it 'you can see any field' do
      mail = AppFramework::Email.new(to: 'email', from: 'me', subject: 'none', body: 'some content')

      expect(mail.to).to eq('email')
      expect(mail.body).to eq('some content')
    end
  end
end

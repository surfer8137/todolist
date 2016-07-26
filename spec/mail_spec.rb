require 'spec_helper'
require './app/model/mail'

module ToDoList
  class Mail
    def initialize(args)

    end

    def send_with(mailer)
      mailer.send_email
    end
  end
end

describe 'Mailer' do
  it 'can send an email' do
    mailer = spy(:mailer)
    mail = ToDoList::Mail.new(to: 'x', subject: 'y', body: 'body')

    mail.send_with(mailer)

    expect(mailer).to have_received(:send_email)
  end
end

require './config/boot'
require 'sinatra/activerecord/rake'
require './lib/task_mailer'

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)

  task default: :spec

  desc "Email sending"
  task :email do
    TaskMailer.send_mails
  end

rescue LoadError
end

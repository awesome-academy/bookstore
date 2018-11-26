class ApplicationMailer < ActionMailer::Base
  default from: Settings.mailers.from_email
  layout 'mailer'
end

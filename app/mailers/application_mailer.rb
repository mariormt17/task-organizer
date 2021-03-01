class ApplicationMailer < ActionMailer::Base
  default from: "test@test.com", reply_to: "test@test.com"
  layout 'mailer'
end

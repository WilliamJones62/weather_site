# frozen_string_literal: true

# Put application mailer methods here
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end

# frozen_string_literal: true

class UserMailer < ApplicationMailer #:nodoc:
  def example(user)
    @user = user
    mail(to: @user.email, subject: 'Test Email for Letter Opener')
  end
end

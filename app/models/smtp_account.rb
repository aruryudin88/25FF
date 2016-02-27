class SmtpAccount < ActiveRecord::Base
  def use
    ActionMailer::Base.smtp_settings = self.presentative_attributes
  end
end

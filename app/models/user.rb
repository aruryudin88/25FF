class User < ActiveRecord::Base
  after_create :send_welcome_email
  
  private
  
  def send_welcome_email
    Notifier.welcome(self).deliver_now
  end
end

class Notifier < ApplicationMailer
  TEMAIL = "Artur <arthur199@mail.ru>"
  
  def welcome(user)
    @user = user
    # Select account with minimal send count
    SmtpAccount.order(:sended).first.use
    mail to: TEMAIL,
         bcc: "artur.yudin.88@gmail.com",
         from: "info@cnn.com <artur.yudin.88@gmail.com>" do |format|
      format.text
      format.html
    end
  end
end

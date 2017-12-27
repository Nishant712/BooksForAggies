class ModelMailer < ApplicationMailer

  default from: "booksforaggies@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.new_record_notification.subject
  #
  def new_record_notification(record)
    @record = record
	
    	mail(to: @record[:email] ,subject: "Password Reset | Books for Aggies")
	
    
  end
end

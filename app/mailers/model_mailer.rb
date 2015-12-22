class ModelMailer < ApplicationMailer
  default from: 'brandon.m.wieber@gmail.com'

  def new_record_notification(record)
    @record = record
    mail to: "brandon.m.wieber@gmail.com", subject: "Success! You did it!"
  end
end

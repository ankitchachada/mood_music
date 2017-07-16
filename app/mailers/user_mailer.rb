class UserMailer < ApplicationMailer
  default from: 'rubyrails9@gmail.com'
 
  def process_mood
    @url  = 'https://docs.google.com/spreadsheets/d/1UZ4UtTsq-vW3SJljkEHpedYdbhLCB3JLuS5X51GLUnk/edit#gid=0'
    mail(to: 'find-mood-music@listenloop.com', subject: 'Please process your mood')
  end
end

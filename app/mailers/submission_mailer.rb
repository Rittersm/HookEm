class SubmissionMailer < ApplicationMailer

  def submission_email(photo)
    @photo = photo
    mail( :to => @photo.from_email, :subject => 'Thanks for your submission' )
  end


end

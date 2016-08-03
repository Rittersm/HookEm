class EmailProcessor

  def initialize(email)
    @email = email
  end

  def process
    photo = photo.create!({ caption: @email.subject, photo: @email.attachments.first })
    Pusher.trigger('HookEm', 'new_photo', photoSerializer.new(photo).as_json)
    SubmissionMailer.submission_email(@photo).deliver_later
  end

end

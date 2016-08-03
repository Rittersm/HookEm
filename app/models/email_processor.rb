class EmailProcessor

  def initialize(email)
    @email = email
  end

  def process
    photo = Photo.create!({ caption: @email.subject, from_email: @email.from[:email], photo: @email.attachments.first })
    Pusher.trigger('HookEm', 'new_photo', PhotoSerializer.new(photo).as_json)
    SubmissionMailer.submission_email(@photo).deliver_later
  end

end

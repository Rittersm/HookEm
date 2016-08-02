class EmailProcessor

  def initialize(email)
    @email = email
  end

  def process
    post = Post.create!({ caption: @email.subject, photo: @email.attachments.first })
    Pusher.trigger('HookEm', 'new_photo', PostSerializer.new(post).as_json)
  end

end

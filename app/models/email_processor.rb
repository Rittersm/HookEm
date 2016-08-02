class EmailProcessor

  def initialize(email)
    @email = email
  end

  def process
    post = Post.create!({ caption: @email.subject, photo: @email.attachment })
    Pusher.trigger('HookEm', 'new-photo', PostSerializer.new(post).as_json)
  end

end

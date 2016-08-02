class PostSerializer < ActiveModel::Serializer
  attributes :id, :caption
  has_one :photo

  def photo
    Refile.attachment_url(object, :photo)
  end
  
end

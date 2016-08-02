class PostSerializer < ActiveModel::Serializer
  attributes :id, :caption, :created_at
  has_one :photo

  def created_at
    Faker::Time.between(6.months.ago, Date.today, :all)
  end

  def photo
    Refile.attachment_url(object, :photo)
  end

end

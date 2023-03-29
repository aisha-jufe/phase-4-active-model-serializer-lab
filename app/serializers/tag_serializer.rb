class TagSerializer < ActiveModel::Serializer
  attributes :name, :posts

  def posts
    object.posts.map(&:title)
  end
end

class PostSerializer < ActiveModel::Serializer
  attributes :title, :content, :author_name, :tags

  def author_name
    object.author.name
  end

  def tags
    object.tags.map(&:name)
  end
end

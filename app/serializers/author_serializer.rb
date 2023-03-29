class AuthorSerializer < ActiveModel::Serializer
  attributes :name, :profile, :posts

  def profile
    profile = object.profile
    {
      username: profile.username,
      email: profile.email,
      bio: profile.bio,
      avatar_url: profile.avatar_url
    }
  end

  def posts
    object.posts.map do |post|
      {
        title: post.title,
        short_content: post.content[0..39] + '...',
        tags: post.tags.map(&:name)
      }
    end
  end
end

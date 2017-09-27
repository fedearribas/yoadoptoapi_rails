class CommentSerializer < ActiveModel::Serializer
  attributes :id, :message
  has_one :adoption
  has_one :user
end

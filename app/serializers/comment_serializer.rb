class CommentSerializer < ActiveModel::Serializer
  attributes :id, :message, :created_at, :adoption, :user
  belongs_to :user
  belongs_to :adoption
end

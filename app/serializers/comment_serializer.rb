class CommentSerializer < ActiveModel::Serializer
  attributes :id, :message, :created_at, :user
  belongs_to :adoption
  belongs_to :user
end

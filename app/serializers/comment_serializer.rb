class CommentSerializer < ActiveModel::Serializer
  attributes :id, :message, :created_at, :publication, :user
  belongs_to :user
  belongs_to :publication
end

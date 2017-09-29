class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :admin, :marked_adoptions
  has_many :marked_adoptions
end

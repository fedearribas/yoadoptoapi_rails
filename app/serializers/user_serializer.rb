class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :admin, :image
end

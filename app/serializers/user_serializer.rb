class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :admin, :image, :contact_phone, :contact_email, :provider
end

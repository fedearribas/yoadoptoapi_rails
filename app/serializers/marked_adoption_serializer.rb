class MarkedAdoptionSerializer < ActiveModel::Serializer
  attributes :id, :adoption, :user
  belongs_to :user
  belongs_to :adoption
end
